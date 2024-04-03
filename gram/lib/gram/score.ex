defmodule Gram.Score do
  defstruct reds: 0, whites: 0, blacks: 4

  def new(answer, guess) do
    reds =
      answer
      |> Enum.zip(guess)
      |> Enum.count(fn {first, second} -> first == second end)

    blacks = length(guess -- answer)

    whites = 4 - reds - blacks

    %__MODULE__{reds: reds, whites: whites, blacks: blacks}
  end

  def show(%{reds: r, whites: w, blacks: b}) do
    reds = String.duplicate("_r_|", r)
    whites = String.duplicate("_w_|", w)
    blacks = String.duplicate("___|", b)

    [reds, whites, blacks]
    |> Enum.reject(fn ch -> ch == "" end)
    |> Enum.join("|")
  end
end
