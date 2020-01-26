# Write your code here!

require 'pry'


# def game_hash 
#     hashketball = {:home => {}, :away => {}}
    
#     hashketball[:home] = {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => []}
#     hashketball[:away] = {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => []}
    
#     hashketball[:home][:players].push({:players_name => "Alan Anderson", :number => 0, :shoe => 16, :points =>22, :rebounds =>12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1})
#     hashketball[:home][:players].push({:players_name => "Reggie Evans", :number => 30, :shoe => 14, :points =>12, :rebounds =>12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7})
#     hashketball[:home][:players].push({:players_name => "Brook Lopez", :number => 11, :shoe => 17, :points =>17, :rebounds =>19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15})
#     hashketball[:home][:players].push({:players_name => "Mason Plumlee", :number => 1, :shoe => 19, :points =>26, :rebounds =>11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5})
#     hashketball[:home][:players].push({:players_name => "Jason Terry", :number => 31, :shoe => 15, :points =>19, :rebounds =>2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1})
    
#     hashketball[:away][:players].push({:players_name => "Jeff Adrien", :number => 4, :shoe => 18, :points =>10, :rebounds =>1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2})
#     hashketball[:away][:players].push({:players_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points =>12, :rebounds =>4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10})
#     hashketball[:away][:players].push({:players_name => "DeSagna Diop", :number => 2, :shoe => 14, :points =>24, :rebounds =>12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5})
#     hashketball[:away][:players].push({:players_name => "Ben Gordon", :number => 8, :shoe => 15, :points =>33, :rebounds =>3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0})
#     hashketball[:away][:players].push({:players_name => "Kemba Walker", :number => 33, :shoe => 15, :points =>6, :rebounds =>12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12})
    
#     hashketball
    
# end

def game_hash 
    {
      :home =>{
        :team_name =>"Brooklyn Nets",
        :colors =>["Black", "White"],
        :players =>[
          {:player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds =>12,
            :assists =>12,
            :steals =>3,
            :blocks =>1,
            :slam_dunks => 1},
            {:player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds =>12,
            :assists =>12,
            :steals =>12,
            :blocks =>12,
            :slam_dunks =>7},
            {:player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds =>19,
            :assists =>10,
            :steals =>3,
            :blocks =>1,
            :slam_dunks => 15},
            {:player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds =>11,
            :assists =>6,
            :steals =>3,
            :blocks =>8,
            :slam_dunks => 5},
            {:player_name => "Jason Terry",
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds =>2,
            :assists =>2,
            :steals =>4,
            :blocks =>11,
            :slam_dunks => 1}]
      },
      :away =>{
        :team_name =>"Charlotte Hornets",
        :colors =>["Turquoise", "Purple"],
        :players =>[
          {:player_name => "Jeff Adrien",
            :number => 4,
            :shoe => 18,
            :points =>10 ,
            :rebounds =>1,
            :assists =>1,
            :steals =>2,
            :blocks =>7,
            :slam_dunks =>2},
            {:player_name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points =>12 ,
            :rebounds =>4,
            :assists =>7,
            :steals =>22,
            :blocks =>15,
            :slam_dunks =>10},
            {:player_name => "DeSagna Diop",
            :number => 2,
            :shoe => 14,
            :points =>24 ,
            :rebounds =>12,
            :assists =>12,
            :steals =>4,
            :blocks =>5,
            :slam_dunks =>5},
            {:player_name => "Ben Gordon",
            :number => 8,
            :shoe => 15,
            :points =>33 ,
            :rebounds =>3,
            :assists =>2,
            :steals =>1,
            :blocks =>1,
            :slam_dunks =>0},
            {:player_name => "Kemba Walker",
            :number => 33,
            :shoe => 15,
            :points =>6 ,
            :rebounds =>12,
            :assists =>12,
            :steals =>7,
            :blocks =>5,
            :slam_dunks =>12}]
        
      }}
  end




def num_points_scored(players_name)
    game_hash.each do |place,team|
      team.each do |attribute,data|
        if attribute == :players
          data.each do |player|
            if player[:player_name] == players_name
              return player[:points] 
            end
          end
        end
      end
    end
  end


def shoe_size(name)
    game_hash.each do |place,data|
      data.each do |k,v|
        if k == :players 
          v.each do |player|
            if player[:player_name] == name
              return player[:shoe]
            end
          end
        end
      end
    end
  end


def team_colors(team_name)
    game_hash.each do |home_away, value|
        if value[:team_name] == team_name 
            return value[:colors]
        end
    end
end


def team_names 
    game_hash.map do |home_away, value| 
        value[:team_name]
    end
end

# -----> Other way to solve it: 
# def team_names 
#     new_array = []
#     game_hash.each do |home_away, value|
#         new_array << value[:team_name]
#     end
# end


def player_numbers(team_name)
   if game_hash[:home][:team_name] == team_name
        game_hash[:home][:players].map { |x| x[:number]}
    elsif game_hash[:away][:team_name] == team_name
        game_hash[:away][:players].map { |x| x[:number]}
    end
end


#---->Ahother way to solve it:
# def player_numbers(team_name)
#     new_arr []
#     game_hash.each do |home_away, value|
#         if value[:team_name] == team_name
#             value.each do |attributes, data|
#                 if attributes == :players 
#                     data.each do |player|
#                         new_arr << player[:number]
#                     end
#                 end
#             end
#         end
#     end
#     new_arr
# end



#Check the stats on game_hash??:
def player_stats(player_name)
    hash={}
    game_hash.each do |place,team|
      team.each do |attributes,values|
          if attributes == :players
            values.each do |player|
              if player[:player_name] == player_name
                hash = player.delete_if do |k,v|
                  k == :player_name
                end
            end
          end
        end
      end
    end
    hash
  end

  def big_shoe_rebounds
    size  = 0
    rebounds = 0
    game_hash.each do |place,data|
      data.each do |attributes,values|
        if attributes == :players 
          values.each do |player|
            if player[:shoe] > size
              size = player[:shoe]
              rebounds = player[:rebounds]
            end
          end
        end
      end
    end
    rebounds
  end 
  


def most_points_scored
    points = 0 
    mvp = ""
    game_hash.values.each do |value|
      value[:players].each do |player|
        if player[:points] > points
          points = player[:points]
          mvp = player[:player_name]
        end
      end
    end
    mvp
  end

  def winning_team 
    win_team = {}
    game_hash.values.each do |value|
        points = 0
       value[:players].each do |player|
        points += player[:points]
      end
      win_team[value[:team_name]] = points
    end
    win_team.key(win_team.values.max)
  end
  

  def player_with_longest_name
    longest_name = []
    game_hash.values.each do |value|
      value[:players].each do |player|
        longest_name << player[:player_name]
      end
    end
    longest_name.max{|a,b| a.length <=> b.length}
  end


  def long_name_steals_a_ton?
    steal_points = 0
    player_with_most_steals = ""
    game_hash.values.each do |value|
      value[:players].each do |player|
         player[:steals] > steal_points
         steal_points = player[:steals]
        player_with_most_steals = player[:player_name]
        if player_with_most_steals == player_with_longest_name
          return true
        end
      end
    end
  end



