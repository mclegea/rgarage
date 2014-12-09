class ListController < ApplicationController
        def new
	   @list = List.new
	end
end
