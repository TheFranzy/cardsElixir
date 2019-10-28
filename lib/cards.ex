defmodule Cards do
  @moduledoc """
  Provides methodsr creating and handling a deck of cards
  """

  @doc """
  Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", 
    "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

    suits = ["Clubs", "Spades", "Diamonds", "Hearts"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Returns a list of strings representing a deck of playing cards in a shuffled order
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Returns a boolean indicating if the deck of cards contains the specified string
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Returns a specified number of strings representing a hand of playing cards
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Saves a file containing a list representing a deck of playing cards
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Loads a saved list representing a deck of playing cards
  """
  def load(filename) do

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "that file does not exist"
    end

  end

  @doc """
  Returns a list of a specific number of strings representing playing cards
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
