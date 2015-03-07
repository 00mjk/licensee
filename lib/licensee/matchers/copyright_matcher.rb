class Licensee
  class CopyrightMatcher < Matcher

    REGEX = /\A(Copyright|Copyright ©|Copyright \(c\)) \d{4}.*?\n?\z/i

    def match
      no_license if file.content.strip =~ REGEX
    end

    def confidence
      100
    end

    private

    def no_license
      @no_license ||= Licensee::Licenses.find("no-license")
    end
  end
end
