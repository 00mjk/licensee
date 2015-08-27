require 'helper'

class TestLicenseeExactMatcher < Minitest::Test

  def setup
    text = File.open(Licensee::License.find("mit").path).read.split("---").last
    blob = FakeBlob.new(text)
    @mit = Licensee::ProjectFile.new(blob, "LICENSE")
  end

  should "match the license" do
    assert_equal "mit", Licensee::ExactMatcher.match(@mit).key
  end

  should "know the match confidence" do
    assert_equal 100, Licensee::ExactMatcher.new(@mit).confidence
  end
end
