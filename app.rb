require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/howdy") do
  hi

  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("user_square").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root)
end

get("/square_root/results") do
  @the_sqrt_num = params.fetch("user_sqrt").to_f

  @sqrt_result = Math.sqrt(@the_sqrt_num)

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment)
end

get("/payment/results") do
  @the_APR = params.fetch("user_APR").to_f

  @the_YRS = params.fetch("user_years").to_f

  @the_Principal = params.fetch("user_pv").to_f

  @rate_per_period = @the_APR / 12 / 100

  @periods = @the_YRS * 12

  @the_payment = (@rate_per_period*@the_Principal)/(1 - (1 + @rate_per_period)**-@periods)

  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @the_min = params.fetch("user_min").to_f

  @the_max = params.fetch("user_max").to_f

  erb(:random_results)
end
