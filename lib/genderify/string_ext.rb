# encoding: utf-8

String.class_eval do

  # Genderifies string. This is done by replacing every occurence of (x|y) 
  # with either left (x) or right part (y) of it based on the gender provided as argument. 
  # If argument of function is :f, 'f', :F, 'F', 1, '1', :female or 'female' it will pick 
  # the right side. Anything else, including nil, will use the left side as replacement. 
  # Hm, is this sexist? 
  #
  # Argument can also be an object that responds to 'gender' call. Returning value of such
  # function will be applied to stated rules above.
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

