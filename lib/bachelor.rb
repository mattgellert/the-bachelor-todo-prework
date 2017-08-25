require 'pry'
def get_first_name_of_season_winner(data, season)
  first_name = ""
  people = data[season]
  people.each {|person|
    person.each {|info, val|
      if val == "Winner"
        first_name = person["name"].split(" ")[0]
      end
    }
  }
  first_name
end

def get_contestant_name(data, occupation)
  name = ""
  data.each {|seasons, people|
      people.each {|person|
        person.each {|info, val|
          if val == occupation
            name = person["name"]
          end
        }
      }
    }
  name
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each {|seasons, people|
      people.each {|person|
        person.each {|info, val|
          if val == hometown
            count += 1
          end
        }
      }
    }
  count
end

def get_occupation(data, hometown)
  occupation = ""
  data.each {|seasons, people|
      people.each {|person|
        person.each {|info, val|
          if val == hometown
            occupation = person["occupation"]
            return occupation
          end
        }
      }
    }
end

def get_average_age_for_season(data, season)
  age_arr = []
  sum = 0
  avg_age = 0

  people = data[season]
  people.each {|person|
    age_arr << person["age"].to_i
  }

  age_arr.each {|i| sum += i}
  avg_age = sum.to_f / age_arr.length.to_f
  avg_age = avg_age.round
end
