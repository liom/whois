#
# = Ruby Whois
#
# An intelligent pure Ruby WHOIS client and parser.
#
#
# Category::    Net
# Package::     Whois
# Author::      Simone Carletti <weppos@weppos.net>
# License::     MIT License
#
#--
#
#++


require 'whois/answer/parser/base'


module Whois
  class Answer
    class Parser

      #
      # = whois.netcom.cm parser
      #
      # Parser for the whois.netcom.cm server.
      #
      # NOTE: This parser is just a stub and provides only a few basic methods
      # to check for domain availability and get domain status.
      # Please consider to contribute implementing missing methods.
      # See WhoisNicIt parser for an explanation of all available methods
      # and examples.
      #
      class WhoisNetcomCm < Base

        property_supported :status do
          @status ||= if content_for_scanner =~ /Status:\s+(.*?)\n/
            case $1.downcase
              when "active"         then :registered
              when "not registered" then :available
              else
                raise ParserError, "Unknown status `#{$1}'. " <<
                      "Please report the issue at http://github.com/weppos/whois/issues"
            end
          end
        end

        property_supported :available? do
          @available ||= (status == "Not Registered")
        end

        property_supported :registered? do
          !available?
        end


        property_supported :created_on do
          @created_on ||= if content_for_scanner =~ /Created:\s+(.*)\n/
            Time.parse($1)
          end
        end

        property_supported :updated_on do
          @updated_on ||= if content_for_scanner =~ /Modified:\s+(.*)\n/
            Time.parse($1)
          end
        end

        property_supported :expires_on do
          @expires_on ||= if content_for_scanner =~ /Expires:\s+(.*)\n/
            Time.parse($1)
          end
        end


        property_supported :nameservers do
          @nameservers ||= if content_for_scanner =~ /Name Servers:\n((.+\n)+)\n/
            $1.split("\n").map(&:strip)
          else
            []
          end
        end

      end

    end
  end
end
