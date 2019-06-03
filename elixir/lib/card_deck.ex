defmodule PlayingCards.CardDeck do
  alias PlayingCards.Card

  @cards (
           cards =
             for suit <- ~w(♠︎ ♣︎ ♥︎ ♦︎),
                 rank <- ~w(A 2 3 4 5 6 7 8 9 10 J Q K),
                 do: %Card{suit: suit, rank: rank}

           jokers = List.duplicate(%Card{suit:"*", rank:"Joker"}, 2)
           cards ++ jokers
         )

  def new, do: @cards

  def size(deck) do
    length(deck)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def draw(deck) do
    List.pop_at(deck, 0)
  end

  def cut(deck, num_of_cards) do
    Enum.split(deck, num_of_cards)
  end
end
