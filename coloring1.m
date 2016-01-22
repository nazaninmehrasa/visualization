function coloring1( frame_numbers, superPixels,sup)
    load('vw_commercial_vidinfo.mat')
    load('/cs/vml2/nmehrasa/eccv16/code/similarities.mat')
    load('allsegsvw_commercial.mat')
    [r,c]=find(mapped==sup);
    disp(r)
   
    for frame = 1:21
        idx=find(frame_numbers==frame);
        if(~isempty(idx))
           % figure;
            img=ones(360,640);
            img=0.5.*img;
            sp_temp=superPixels(:,idx);
            is_mem=ismember(labelledlevelvideo(:,:,frame),sp_temp);
            
            if(r==frame)
                [row,col]=find(labelledlevelvideo(:,:,frame)==sup);
                disp(size(row,1));
                for i=1:size(row,1)
                    img(row(i,1),col(i,1))=100;
                end
            end
             img=img.*is_mem;
             img = (cat(3,img,img,img));
             imwrite(img,['./coloring4/',num2str(frame),'.jpg']);
        end
    end
    
    
    
    
end
