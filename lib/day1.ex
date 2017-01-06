defmodule AdventOfCode.Day1 do
  def init do
    # reading relative to the mix file
    {:ok, input} = File.read "lib/day1.txt"
    input = String.split(input, ", ", trim: true)
            |> Enum.map(&split_pair/1)
    compute_blocks(tl(input), get_next_direction(hd(input)), get_distance(hd(input)))
  end

  def split_pair(pair) do
    String.split(pair, "")
    |> Enum.drop(-1)
  end

  def get_distance(pair) do
    Enum.at(pair, 1)
    |> String.to_integer
  end

  def get_next_direction(pair) do
    Enum.at(pair, 0)
  end

  def compute_blocks([head | tail], current_dir, acc) do
    current_distance = get_distance head
    nxt_dir = get_next_direction head
    if (nxt_dir == current_dir) do
      compute_blocks(tail, get_next_direction(head), acc - current_distance)
    else
     compute_blocks(tail, get_next_direction(head), acc + current_distance)
    end
  end

  def compute_blocks([], _, acc) do
    acc
  end
end
