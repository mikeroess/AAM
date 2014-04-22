module JewelryHelper
  def pager(current)
    links = []
    {'1' => 'one', '2' => 'two', '3' => 'three', '4' => 'four'}.each_pair do |number, word|
      item = if current == number
        "Page #{word}"
      else
        link_to("Page #{word}", jewelry_path(page: number)).html_safe
      end
      links << item
    end
    links.join(' | ').html_safe
  end
end
