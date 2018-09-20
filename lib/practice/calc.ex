defmodule Practice.Calc do

  def tag_token(string) do
    case Float.parse(string) do
      :error -> {:op, string}
      _      -> {:num, elem(Float.parse(string), 0)} 
    end
  end

  def tag_tokens(strings) do
    Enum.map(strings, &tag_token/1)
  end

  def eval_mul_div(tokens, acc, cur_val) do
    cond do
      []         == tokens     -> acc ++ [{:num, cur_val}]
      {:op, "*"} == hd(tokens) -> eval_mul_div(tl(tl(tokens)), acc, cur_val * elem(hd(tl(tokens)), 1))  
      {:op, "/"} == hd(tokens) -> eval_mul_div(tl(tl(tokens)), acc, cur_val / elem(hd(tl(tokens)), 1))  
      {:op, "+"} == hd(tokens) -> eval_mul_div(tl(tl(tokens)), acc ++ [{:num, cur_val}, hd(tokens)], elem(hd(tl(tokens)), 1))  
      {:op, "-"} == hd(tokens) -> eval_mul_div(tl(tl(tokens)), acc ++ [{:num, cur_val}, hd(tokens)], elem(hd(tl(tokens)), 1))  
    end
  end

  def eval_mul_div(tokens) do
    eval_mul_div(tl(tokens), [], elem(hd(tokens), 1))
  end

  def eval_add_min(tokens, cur_val) do
    cond do
      []         == tokens     -> cur_val 
      {:op, "+"} == hd(tokens) -> eval_add_min(tl(tl(tokens)), cur_val + elem(hd(tl(tokens)), 1))  
      {:op, "-"} == hd(tokens) -> eval_add_min(tl(tl(tokens)), cur_val -  elem(hd(tl(tokens)), 1))  
    end
  end

  def eval_add_min(tokens) do
    eval_add_min(tl(tokens), elem(hd(tokens), 1))
  end

  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    expr
    |> String.split(~r/\s+/)
    |> IO.inspect
    |> tag_tokens 
    |> IO.inspect
    |> eval_mul_div
    |> IO.inspect
    |> eval_add_min

    # Hint:
    # expr
    # |> split
    # |> tag_tokens  (e.g. [+, 1] => [{:op, "+"}, {:num, 1.0}]
    # |> convert to postfix
    # |> reverse to prefix
    # |> evaluate as a stack calculator using pattern matching
  end

  def prime?(x) do
    largest_possible = x + 1
      |> :math.sqrt
      |> Float.ceil
      |> trunc 

    x > 1 and not Enum.any?(Enum.drop(2..largest_possible, -1), &(rem(x, &1) == 0 and x != &1))
  end

  def factor(x, acc, check) do
    cond do
      prime?(x)           -> acc ++ [x] 
      check > x / 2       -> acc
      rem(x, check) == 0  -> factor(trunc(x / check), acc ++ [check], 2)
      rem(x, check) != 0  -> factor(x, acc, check + 1)
    end
  end

  def factor(x) do
    factor(x, [], 2)
  end

end
