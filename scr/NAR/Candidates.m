function [I_cand] = Candidates (B)
        [c,r] = size(B);
        
        Reverse_reactions = [];
        for i = 1:r-1
            for j = i+1:r
                if B(:,i) == - B(:,j)
                   Reverse_reactions = union(Reverse_reactions,j); 
                end
            end
        end
        
        Rev = numel(Reverse_reactions);
        B(:,Reverse_reactions) = zeros(c,Rev);

       Important_complexes = [];
        for i =1:c
            if nnz(B(i,:)) == 1 
               Important_complexes = [Important_complexes,i];
            end
        end

        Original_complexes = 1:c;
        I_cand = setdiff(Original_complexes,Important_complexes);
end
