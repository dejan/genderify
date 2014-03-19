# encoding: utf-8

String.class_eval do

  # Genderifies string. This is done by replacing every occurence of (x|y) 
  # with either left - x or right part - y of it based on the gender provided as 
  # an argument. 
  # 
  # The argument can either be gender symbol or an object that responds to `gender` 
  # returning gender symbol. If gender symbol is :f, 'f', :F, 'F', 1, '1', 
  # :female or 'female' String will be updated by replacing (x|y) with y.
  # Any other value for gender symbol, including nil, will be interpreted as male 
  # gender (sexist or what?) and therefore replace (x|y) with x. 
  #
  # Example: 
  #
  #   >> "About (him|her)".genderify(:f) 
  #   => "About her"
  #
  def genderify(genderable)
    gender = genderable.respond_to?(:gender) ? genderable.gender : genderable
    gsub(/\((.+?)\|(.+?)\)/) do
      case gender
      when :f, 'f', :F, 'F', 1, '1', :female, 'female'
        $2
      else
        $1
      end
    end
  end

end

