class SecretSerializer < ActiveModel::Serializer
  attributes :id, :content, :next_id, :previous_id
end
