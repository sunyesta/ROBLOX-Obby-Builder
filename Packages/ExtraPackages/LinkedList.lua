--: src: https://devforum.roblox.com/t/linked-list-lua-implementation/1189304
local LinkedList = {}
local NodeClass = require(script.Parent.NewNode)

LinkedList.__index = LinkedList


function LinkedList.new(InitalValue) -- constructor
    
    local self = setmetatable({
        Head = {
            Value = InitalValue;
            Next = nil;
        };
    }, LinkedList);
    
    self.Tail = self.Head;
    self.Len = 1;
    
    return self;
end

function LinkedList:TraverseIndex(Index)
    
    local CurrentNode = self.Head
    
    for Num = 1, Index do
       CurrentNode = CurrentNode.Next or CurrentNode; 
    end
    
    return CurrentNode
end

function LinkedList:Insert(Index, Value)
    
    assert(self.Len-1 >= Index, "Cannot get nil node");
    
    local NewNode = NodeClass.new(Value);
    local Node = self:TraverseIndex(Index);
    local HoldNode = Node.Next;
    
    Node.Next = NewNode;
    NewNode.Next = HoldNode;
    self.Len += 1;
end

function LinkedList:Remove(Index)
    
    assert(self.Len >= Index, "Cannot remove nil node");
    
    local HeadNode = self:TraverseIndex(Index-1); -- find the parent node and reassign
    local Holder = HeadNode.Next;
    HeadNode.Next = Holder.Next;
    self.Len -= 1
    
    local TailNode = self:TraverseIndex(self.Len); -- make sure we dont leave tail node nil.
    self.Tail = TailNode
    
end

function LinkedList:Append(Value)
    local Node = NodeClass.new(Value);
    self.Tail.Next = Node;
    self.Tail = self.Tail.Next;
    self.Len += 1;
end

function LinkedList:Prepend(Value)
    local Node = NodeClass.new(Value);
    Node.Next = self.Head;
    self.Head = Node;
    self.Len += 1;
end

return LinkedList
