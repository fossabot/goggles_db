# frozen_string_literal: true

#
# = Version module
#
#   - version:  7.009
#   - author:   Steve A.
#
#   Semantic Versioning implementation.
module GogglesDb
  # Gem version
  VERSION = '0.1.8'

  module Version
    # Framework Core internal name.
    CORE    = 'C7'

    # Major version.
    MAJOR   = '7'

    # Minor version.
    MINOR   = '008'

    # Current build version.
    BUILD   = '20201009'

    # Full versioning for the current release (Framework + Core).
    FULL    = "#{MAJOR}.#{MINOR}.#{BUILD} (#{CORE} v. #{VERSION})"

    # Compact versioning label for the current release.
    COMPACT = "#{MAJOR.gsub('.', '')}#{MINOR}"

    # Current internal DB structure version
    # (this is independent from migrations and framework release)
    DB      = '1.30.00'

    # Pointless UNICODE emojis, just for fun:
    EMOJI_BUTTERFLY    = 'з== ( ▀ ͜͞ʖ▀) ==ε'
    EMOJI_FREESTYLE    = 'ᕙ ( ▀ ͜͞ʖ▀) /^'
    EMOJI_BREASTSTROKE = '( ▀ ͜͞ʖ▀)/^/^'
    EMOJI_BACKSTROKE   = '٩ (◔^◔) ۶'
    EMOJI_STRONGMAN    = 'ᕦ(ò_óˇ)ᕤ'
    EMOJI_TEDDYBEAR    = 'ʕ•ᴥ•ʔ'
    EMOJI_SHRUG        = '¯\_(ツ)_/¯'
  end
end
