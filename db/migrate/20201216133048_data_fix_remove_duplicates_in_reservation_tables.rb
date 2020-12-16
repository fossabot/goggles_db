# frozen_string_literal: true

class DataFixRemoveDuplicatesInReservationTables < ActiveRecord::Migration[6.0]
  def self.up
    puts "\r\n--> Updating associations to MeetingReservation (tot.: #{GogglesDb::MeetingReservation.count}; '.' = x10):"
    GogglesDb::MeetingReservation.all.each_with_index do |mres, index|
      GogglesDb::MeetingEventReservation.where(meeting_id: mres.meeting_id, badge_id: mres.badge_id)
                                        .update_all(meeting_reservation_id: mres.id)

      GogglesDb::MeetingRelayReservation.where(meeting_id: mres.meeting_id, badge_id: mres.badge_id)
                                        .update_all(meeting_reservation_id: mres.id)

      $stdout.write("\033[1;33;32m.\033[0m") if (index % 10).zero?
    end

    remove_duplicates(GogglesDb::MeetingEventReservation)
    remove_duplicates(GogglesDb::MeetingRelayReservation)
  end

  def self.down
    # Can't go back to old structure after this:
    raise ActiveRecord::IrreversibleMigration
  end
  #-- --------------------------------------------------------------------------
  #++

  # Searches groups of duplicate reservations for the same [badge, meeting event] and removes them
  #
  def self.remove_duplicates(klass)
    # Build an array of [badge_id, meeting_event_id] for any reservation found created twice or more:
    dup_event_res_list = klass.group(:badge_id, :meeting_event_id)
                              .count(:meeting_event_id)
                              .map { |grp| grp.first if grp.last > 1 }
                              .compact
    puts "\r\n--> Found #{dup_event_res_list.count} groups with #{klass} duplicates; deleting:"
    dup_event_res_list.each do |tuple|
      badge_id, meeting_event_id = tuple
      duplicate_ids = klass.select(:id)
                           .where(badge_id: badge_id, meeting_event_id: meeting_event_id)
                           .order(:updated_at)
                           .map(&:id)
      # Keep the last ID found in the group, by removing from the to-be-deleted list:
      # (hopefully, the last one will be the one updated more recently - but most duplicates have the same timestamps)
      duplicate_ids.pop
      klass.where(id: duplicate_ids).delete_all
      $stdout.write("\033[1;33;32m.\033[0m")
    end
  end
end
