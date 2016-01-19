%function coloring2( frame_numbers, superPixels)
   % frame_numbers=[1 21];
    %superPixels=[1 2263 4315 12 4308 ];
    load('vw_commercial_vidinfo.mat')
    load('/cs/vml2/nmehrasa/eccv16/code/similarities.mat')
    load('allsegsvw_commercial.mat')
    
    %finding the 300 top similar superpixel
    
    sup=20;
    row20=similarities(sup,:);
    [sorted_row, Ind]=sort(row20);
    %superPixels=Ind(1,1:300);
    superPixels1=Ind(1,1:300);
    
    %creating the superPixels matrix and frame_numbers array
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
    
    %coloring
    count=0;
    for frame = 1:21
        idx=find(frame_numbers==frame);
        if(~isempty(idx))
           % figure;
            img=ones(360,640);
            img=255.*img;
            img = (cat(3,img,img,img));
            sp_temp=superPixels(:,idx);
            is_mem=ismember(labelledlevelvideo(:,:,frame),sp_temp);
            is_mem=(cat(3,is_mem,is_mem,is_mem));
            img=img.*is_mem;
            imwrite(img,['./coloring2/',num2str(frame),'.jpg']);
        end
    end
    
    
    
     
%end
