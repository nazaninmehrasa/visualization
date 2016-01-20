function [frame_numbers,superPixels]=cons_superPixel( mapped, superPixels1)


is_mem_mapped=ismember(mapped, superPixels1);
    [row_s,col_s]=find(is_mem_mapped==1);
    [row_s, index_row_s]=sort(row_s);
    temp=col_s(index_row_s);
    siz=size(unique(row_s),1);
    mat=zeros(siz,siz);
    pre=1;
    index=1;
    mat=[unique(row_s)'; mat];
    for i=1:size(row_s,1)
        [r,c]=find(mat(1,:)==row_s(i,1));
        if(c~=pre)
            index=1;
            pre=pre+1;
        end
        mat(index+1,pre)=temp(i,1);
        index=index+1;
    end
    frame_numbers=mat(1,:);
    superPixels=mat(2:end,:);
   
end