local Tools = {}

function Tools.AnchorAll(Instance)
    for _, part in pairs (Instance:GetDescendants())do
        if part:IsA("BasePart")then
            part.Anchored = true
        end
        
    end
end

function Tools.CheckForPrimary(Model)
    if not Model.PrimaryPart then
        error(Model:GetFullName().."Has no primary part")
    end
end

return Tools