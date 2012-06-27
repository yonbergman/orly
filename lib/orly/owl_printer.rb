module Orly
  module OwlPrinter

    OWL = <<END
,___,
{o,O}
|)``)
-"-"-
O RLY?
END
    OWL_LINES = OWL.split("\n")

    def self.print(lines = [])
      lines.unshift("") if lines.length < OWL_LINES.length
      [lines.length, OWL_LINES.length].max.times do |i|
        owl_line = OWL_LINES[i] || ""
        print_line = lines[i] || ""
        puts "#{owl_line}\t#{print_line}"
      end
    end
  end
end