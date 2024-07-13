export mysort, mysort!

## Out-of-place exchange sort
function mysort(arr; reverse=false)
    # Create a copy of the to-be sorted array
    returned_array = [val for val in arr]
    # Sort the copy in-place and return it
    mysort!(returned_array)
    returned_array
end

## In-place exchange sort
function mysort!(arr; reverse=false)
    # for reversing we can simply sort -arr so all the < relations are reversed
    if reverse
        return -mysort(-arr)
    end
    for i = 1:length(arr)
        # At the end of this loop arr[i] is guaranteed to be the smallest element in arr[i:end]
        for j = (i+1):length(arr)
            if arr[i] > arr[j]
                arr[i], arr[j] = arr[j], arr[i]
            end
        end
    end
end
