defmodule TestCase do

  defmacro __using__(_opts) do
    quote do
      import TestCase

      @tests []

      @before_compile TestCase
    end
  end

  defmacro test(description, do: block) do
    function_name = String.to_atom("test " <> description)
    quote do
      @tests [unquote(function_name) | @tests ]
      def unquote(function_name)(), do: unquote(block)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def run do
        Enum.each @tests, fn name ->
          IO.puts "Running #{name}"
          apply(__MODULE__, name, [])
        end
      end
    end
  end

end

defmodule MyTest do
  use TestCase

  test "arithmetic operations" do
    4 = 2 + 2
  end

  test "list operations" do
    [1,2,3] = [1,2] ++ [3]
  end

#  test "hello" do
#    "hello" = "world"
#  end

end

MyTest.run
