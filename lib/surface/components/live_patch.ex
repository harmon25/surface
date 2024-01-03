defmodule Surface.Components.LivePatch do
  @moduledoc """
  Defines a link that will **patch** the current LiveView.

  Small Wrapper around live_view `link/1` component.

  Where possible opt for `link/1` instead of these wrappers.
  """

  use Surface.Component

  @doc "The required path to link to"
  prop to, :string, required: true

  @doc "The flag to replace the current history or push a new state"
  prop replace, :boolean, default: false

  @doc "The CSS class for the generated `<a>` element"
  prop class, :css_class

  @doc """
  The label for the generated `<a>` element, if no content (default slot) is provided.
  """
  prop label, :string

  @doc """
  Additional attributes to add onto the generated element
  """
  prop opts, :keyword, default: []

  @doc """
  The content of the generated `<a>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot default

  def render(assigns) do
    ~F"<.link patch={@to} class={@class} {...@opts}><#slot>{@label}</#slot></.link>"
  end
end
