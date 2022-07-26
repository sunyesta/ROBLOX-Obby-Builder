local NewNode = {}

NewNode.__index = NewNode;

function NewNode.new(Value)
    return {
        Value = Value;
        Next = nil;
    }
end


return setmetatable({}, NewNode)