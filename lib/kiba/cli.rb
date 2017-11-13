require 'kiba'

module Kiba
  class Cli
    def self.run(args)
      # unless args.size == 1
      #   puts 'Syntax: kiba your-script.etl'
      #   exit(-1)
      # end
      args.each do |arg|
        filename = arg
        script_content = IO.read(filename)
        job_definition = Kiba.parse(script_content, filename)
        Kiba.run(job_definition)
      end
    end
  end
end
