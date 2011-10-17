# encoding: UTF-8
module NewsHelper

  def paginate(arguments)
	will_paginate arguments,
	  :inner_window => 10,
	  :outer_window => 10,
	  :previous_label => "« Poprzednie",
	  :next_label => "Następne »"
  end


end
