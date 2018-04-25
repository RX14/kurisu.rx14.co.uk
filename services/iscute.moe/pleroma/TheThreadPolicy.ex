defmodule Pleroma.Web.ActivityPub.MRF.TheThreadPolicy do
  def filter(object) do
    if object["context"] == "tag:niu.moe,2018-04-24:objectId=7794625:objectType=Conversation" do
      {:reject, nil}
    else
      {:ok, object}
    end
  end
end
