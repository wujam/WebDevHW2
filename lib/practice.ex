defmodule Practice do
  @moduledoc """
  Practice keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def double(x) do
    2 * x
  end

  def calc(expr) do
    # This is more complex, delegate to lib/practice/calc.ex
    Practice.Calc.calc(expr)
  end

  def factor(x) do
    Practice.Calc.factor(x)
  end

  def prime?(x) do
    Practice.Calc.prime?(x)
  end

  def palindrome?(x) do
    x == String.reverse(x)
  end
end
