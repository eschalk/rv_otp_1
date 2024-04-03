defmodule Gram.Board do

  defstruct answer: [1,2,3,4], history: []

  def new(answer \\ [1,2,3,4]) do
    %__MODULE__{answer: answer}
  end

  def guess(board, guess) do
    %__MODULE__{board | history: [ guess | board.history]}
  end

  def show(board) do
    rows = board.history
    |> Enum.map(fn n -> show_row(board.answer, n) end)
    |> Enum.reverse()
    |> Enum.join("\n")



    """
    board

    |_?_ _?_ _?_ _?_   __ __ __ __
    #{rows}

      #{status(board)}
    """
  end


  def status(board) do
    cond do
      board.answer in board.history -> "won"
      length(board.history) >= 10 -> "lost"
      true -> "playing"
    end
  end

  defp show_row(answer, [first, second, third, fourth]) do
    "|_#{first}_|_#{second}_|_#{third}_|_#{fourth}_| |_r_|_r_|_w_|_w_|"
  end
end
