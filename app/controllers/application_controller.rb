class ApplicationController < ActionController::Base
    def placeholder_set
        @placeholder = {}
        @placeholder["Number"] = "例）1~10/50~100"
        @placeholder["Text"]   = "例）カード/\"6歩カード\""
        @placeholder["Name"]   = "例）太郎/\"次郎\""
        @placeholder["Card"]   = "例）斬払/\"傷突刺\" -列"
        @placeholder["Item"]   = "例）カード/\"6歩カード\""
        @placeholder["BattlePage"]   = "例）1 VS 101"
    end
end
