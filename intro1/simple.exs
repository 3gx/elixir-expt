IO.puts "Hello world from Elixir"

case {1,2,3} do
  {4,5,6} ->
    "Won't match"
  {1, x, 3} ->
    "Binds x to 2"
  _ ->
    "match any value"
end


