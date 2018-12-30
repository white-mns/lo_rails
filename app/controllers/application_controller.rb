class ApplicationController < ActionController::Base
    def placeholder_set
        @placeholder = {}
        @placeholder["Number"] = "例）1~10/50~100"
        @placeholder["Text"]   = "例）カード/\"無名のカード\""
        @placeholder["Name"]   = "例）太郎/\"次郎\""
        @placeholder["Card"]   = "例）斬払/\"傷突刺\" -列"
    end
end
