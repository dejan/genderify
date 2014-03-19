# encoding: utf-8

String.class_eval do

  # Genderifies string. This is done by replacing every occurence of (x|y) 
  # with either left (x) or right part (y) of it based on the gender provided as argument. 
  # If argument of function is :f, 'f', :F, 'F', 1 or '1' it will pick the right side. \
  # Anything else, including omitting it will us the left side as replacement. 
  # Hm, is this sexist? 
  #
  # Example: 
  #   >> "About (him|her)".genderify(:f) 
  #   => "About her"
  def genderify(gender=nil)
    gsub(/\((.+?)\|(.+?)\)/) do
      case gender
      when :f, 'f', :F, 'F', 1, '1'
        $2
      else
        $1
      end
    end

  end

end

