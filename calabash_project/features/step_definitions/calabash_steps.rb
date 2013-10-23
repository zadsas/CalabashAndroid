require 'calabash-android/calabash_steps'
require 'calabash-android/operations'

expectedText = ""
selectedShow = 0

def goto_favourites_list_from_main_screen
	touch(query("imageView index:0"))
	touch(query("textView text:'Merkzettel'"))
	steps %{
		Then I wait for 2 seconds
	}
end

Given /^I am in the main screen$/ do
	steps %{
		Then I wait for 2 seconds
		Given I see the text "TV-Programm"	
	}
end

And /^There is nothing in favourites$/ do
	goto_favourites_list_from_main_screen
	if(query("com.bauermedia.tvmovie.app.view.BroadcastCellView")!=[])
		raise "Favoutires list is not empty"
	end
	
	touch(query("imageView index:0"))
	touch(query("textView text:'Listenansicht'"))
	steps %{
  		Then I wait for 2 seconds
  	}
end

When /^I add one show to favourites$/ do
	expectedText = query("com.bauermedia.tvmovie.app.view.BroadcastCellView index:#{selectedShow}", :titleText)
  	touch(query("com.bauermedia.tvmovie.app.view.BroadcastCellView index:#{selectedShow}"))
  	steps %{
  		Then I wait for 2 seconds
  	}
  	touch(query("com.android.internal.view.menu.ActionMenuItemView contentDescription:'Auf den Merkzettel setzen'"))

  	touch(query("imageView index:0"))
end

Then /^The show appears in favourites$/ do
	goto_favourites_list_from_main_screen
	if(query("com.bauermedia.tvmovie.app.view.BroadcastCellView").count!=1)
		raise "Expected only one show in the favourites list"
	end

	favouritesText=query("com.bauermedia.tvmovie.app.view.BroadcastCellView index:0", :titleText)
	if(favouritesText!=expectedText)
		raise "Show added to favourites does not match show in favourites list"
	end
end