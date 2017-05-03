def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie
    .select(:id, :title, :yr, :score)
    .where(yr: 1980..1989, score: 3..5)

end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie
    .group(:yr)
    .having("MAX(score) <= 8")
    .pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.

  Movie
    .select("actors.id, name")
    .joins(:actors)
    .where(title: title)
    .order("ord")
end

def vanity_projects
  # List the title of all movies in which the director also appeared as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  # dirs = Movie.includes(:director).pluck(:director_id)
  # dirs = dirs.pluck(:director_id)

  Movie
    .select(:id, :title, :name)
    .joins(:actors)
    .where("ord = 1 AND director_id = actors.id")

  # Actor
  #   .select("movies.id, title, name")
  #   .joins(:directed_movies)
  #   .where("ord = 1")
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.

  Actor
    .select("actors.id, name, COUNT(movie_id) AS roles")
    .joins(:castings)
    .where("ord > 1")
    .group(:id)
    .order("COUNT(movie_id) DESC")
    .limit(2)
end
