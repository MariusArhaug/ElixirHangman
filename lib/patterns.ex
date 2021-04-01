defmodule Patterns do

	def switch_tuple({a, b}) do
		IO.puts " #{b} #{a} "
	end

	def check_tuple(:error) do
		IO.puts false
	end

	def check_tuple(:ok) do
		IO.puts true
	end

end
