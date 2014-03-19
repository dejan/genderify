# encoding: utf-8

require "test/unit"
require "genderify"

class StringExtTest < Test::Unit::TestCase

  def test_0_variants
    assert_equal "vozi", "vozi".genderify
    assert_equal "vozi", "vozi".genderify(:f)
  end

  def test_1_variant
    assert_equal "napisao", "napisa(o|la)".genderify
  end

  def test_2_variants
    str = "Gde si krenu(o|la), sad će da postavljaju... Jesi li sigur(an|na)?"
    assert_equal "Gde si krenuo, sad će da postavljaju... Jesi li siguran?",  str.genderify(:m)
    assert_equal "Gde si krenula, sad će da postavljaju... Jesi li sigurna?", str.genderify(:f)
  end
end
