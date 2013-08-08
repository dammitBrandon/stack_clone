require 'spec_helper'

describe AnswersController do
  context "routing" do
    let(:answer) { Answer.create(text: "Hello", question_id: 1, user_id: 1) }

    # it "routes /answers/1 to answers#show" do
    #   {:get => "/answers/1"}.should
    #     route_to({:controller => "answers", :action => "show", :id => 1})
    # end

    # it "routes /answers to answers#index" do
    #   {:get => "/answers"}.should
    #     route_to({:controller => "answers", :action => "index"})
    # end
      it "routes to the answers index path" do
        answers_path.should == '/answers'
      end

      it "routes to the correct answer show path" do
        answer_path(1).should == '/answers/1'
      end

  end

end

