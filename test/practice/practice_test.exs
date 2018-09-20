defmodule Practice.PracticeTest do
  use ExUnit.Case
  import Practice

  test "double some numbers" do
    assert double(4) == 8
    assert double(3.5) == 7.0
    assert double(21) == 42
    assert double(0) == 0
  end

  test "are they prime?????!!!!!!" do
    assert prime?(2)
    assert !prime?(4)
    assert !prime?(8)
    assert !prime?(10)
    assert !prime?(1)
    assert !prime?(0)
    assert !prime?(1025)
    assert !prime?(1027)
    assert !prime?(255)
    assert prime?(1021)
    assert prime?(1031)
  end

  test "factor some numbers" do
    assert factor(5) == [5]
    assert factor(8) == [2,2,2]
    assert factor(12) == [2,2,3]
    assert factor(226037113) == [3449, 65537]
    assert factor(1575) == [3,3,5,5,7]
    assert factor(255) == [3, 5, 17]
  end

  test "evaluate some expressions" do
    assert calc("5") == 5
    assert calc("5 + 1") == 6
    assert calc("5 * 3") == 15
    assert calc("10 / 2") == 5
    assert calc("10 - 2") == 8
    assert calc("5 * 3 + 8") == 23
    assert calc("8 + 5 * 3") == 23
  end

  test "palindrome some strings" do
    assert palindrome?("") == true 
    assert palindrome?("a") == true
    assert palindrome?("1") == true
    assert palindrome?("a1") == false
    assert palindrome?("ab") == false
    assert palindrome?("11111111") == true
    assert palindrome?("asadfhasfdhasodflahsdouhgsdgisdhuoghsohgdosdihgiohsdjoig") == false
    assert palindrome?("asadt11ugu11tdasa") == true
    assert palindrome?("&%%-vonoi23#22#32ionov-%%&") == true
    assert palindrome?("19840@$!1;o12bjpoj2?>,.,,14..12<><>@!$$!24w124,1@$,12$!><@$<!>V<?$<@V>?<!?<F!LK:KVL:K") == false
  end

end
