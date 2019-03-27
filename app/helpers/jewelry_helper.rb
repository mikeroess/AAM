module JewelryHelper
  PAGES = {
    1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four'
  }.freeze

  def pager(current)
    current = current.to_i

    PAGES.map do |(number, word)|
      text = "Page #{word}"
      current == number ? text : link_to(text, jewelry_path(page: number)).html_safe
    end.join(' | ').html_safe
  end
end
