require 'pry'

def game_hash
  {
    :home =>{ :team_name => "Brooklyn Nets",
              :colors => ["Black", "White"],
              :players =>[
                { :player_name => "Alan Anderson",
                  :number => 0 ,
                  :shoe => 16,
                  :points => 22,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks =>1
                },
                { :player_name => "Reggie Evans",
                  :number => 30,
                  :shoe => 14,
                  :points => 12,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7
                },
                { :player_name => "Brook Lopez",
                  :number => 11,
                  :shoe => 17,
                  :points => 17,
                  :rebounds => 19,
                  :assists => 10,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks =>15
                },
                { :player_name => "Mason Plumlee",
                  :number => 1,
                  :shoe => 19,
                  :points => 26,
                  :rebounds =>11,
                  :assists => 6,
                  :steals => 3,
                  :blocks => 8,
                  :slam_dunks =>5
                },
                { :player_name => "Jason Terry",
                  :number => 31,
                  :shoe => 15,
                  :points => 19,
                  :rebounds => 2,
                  :assists => 2,
                  :steals => 4,
                  :blocks => 11,
                  :slam_dunks => 1
                }
              ]
            },
    :away =>{ :team_name => "Charlotte Hornets",
              :colors => ["Turquoise", "Purple"],
              :players =>[
                { :player_name => "Jeff Adrien",
                  :number => 4,
                  :shoe => 18,
                  :points => 10,
                  :rebounds => 1,
                  :assists => 1,
                  :steals => 2,
                  :blocks =>7,
                  :slam_dunks =>2
                },
                { :player_name => "Bismack Biyombo",
                  :number => 0,
                  :shoe => 16,
                  :points => 12,
                  :rebounds => 4,
                  :assists => 7,
                  :steals => 22,
                  :blocks => 15,
                  :slam_dunks => 10
                },
                { :player_name => "DeSagna Diop",
                  :number => 2,
                  :shoe => 14,
                  :points => 24,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 4,
                  :blocks => 5,
                  :slam_dunks => 5
                },
                { :player_name =>"Ben Gordon",
                  :number => 8,
                  :shoe => 15,
                  :points => 33,
                  :rebounds => 3,
                  :assists => 2,
                  :steals => 1,
                  :blocks => 1,
                  :slam_dunks => 0
                },
                { :player_name => "Kemba Walker",
                  :number => 33,
                  :shoe => 15,
                  :points => 6,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 7,
                  :blocks => 5,
                  :slam_dunks => 12
                }
              ]
      }
    }
  #contains and returns a nested hash 
  #{home: {team_name:[str], colors:[arr of str], players:[arr of hash]}}
  #{away: {team_name:[str], colors:[arr of str], players:[arr of hash]}}
  #players: {player_name:[], number:[], shoe:[], points: [], rebounds: [], assists: [], steals:[], blocks:[], slam_dunks:[]}
end 

def num_points_scored(players_name)
  game_hash.each do |place, team|
    team.each do |category, data|
      if category == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points] 
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |category, data|
      if category == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe] 
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  game_hash.map do |place, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |category, data|
        if category == :players
          data.each do |player|
            numbers << player[:number]
          end
        end
      end
    end
  end
numbers
end

def player_stats(players_name)
  player_stat_hash = {}
  game_hash.each do |place, team|
    team.each do |category, data|
      if category == :players
        data.each do |player|
          if player[:player_name] == players_name
            player_stat_hash = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  player_stat_hash
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |place, team|
    team[:players].each do |player|
      shoe_size = player[:shoe]
      if shoe_size > biggest_shoe
        biggest_shoe = shoe_size
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  best_scoring_player = ''
  game_hash.each do |place, team|
    team[:players].each do |player|
      points_scored = player[:points]
      if points_scored > most_points
        most_points = points_scored
        best_scoring_player = player[:player_name]
      end
    end
  end
  best_scoring_player
end

def winning_team
  most_points = 0
  winning_team = ''
  game_hash.each do |place, team|
    team_points = 0 
    team_name = game_hash[place][:team_name]
    team[:players].each do |player|
      points_scored = player[:points]
      team_points += points_scored
    end
    winning_team, most_points = team_name, team_points if team_points > most_points
  end
  winning_team
end

def player_with_longest_name
  longest_name = ''
  longest_name_length = 0 
  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:player_name].length > longest_name_length
        longest_name_length = player[:player_name].length
        longest_name = player[:player_name]
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0 
  best_stealing_player = ''
  game_hash.each do |place, team|
    team[:players].each do |player|
      steals = player[:steals]
      if steals > most_steals
        most_steals = steals
        best_stealing_player = player[:player_name]
      end
    end
  end
  return true if best_stealing_player == player_with_longest_name
end

