# encoding: utf-8

require "ostruct"
require "test/unit"
require "genderify"

class StringExtTest < Test::Unit::TestCase

  def test_0_variants
    assert_equal "foo", "foo".genderify(:f)
  end

  def test_1_variant
    assert_equal "About him", "About (him|her)".genderify(:m)
  end

  def test_2_variants
    str = "Gde si krenu(o|la), sad će da postavljaju... Jesi li sigur(an|na)?"
    assert_equal "Gde si krenuo, sad će da postavljaju... Jesi li siguran?",  str.genderify(:m)
    assert_equal "Gde si krenula, sad će da postavljaju... Jesi li sigurna?", str.genderify(:f)
  end

  def test_genderable_object
    user = OpenStruct.new(gender: 'female', name: 'Jane')
    assert_equal "She is an addict", "(He|She) is an addict".genderify(user)
  end
end
