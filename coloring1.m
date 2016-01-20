function coloring1( frame_numbers, superPixels)
    load('vw_commercial_vidinfo.mat')
    load('/cs/vml2/nmehrasa/eccv16/code/similarities.mat')
    load('allsegsvw_commercial.mat')


   
    for frame = 1:21
        idx=find(frame_numbers==frame);
        if(~isempty(idx))
           % figure;
            img=ones(360,640);
            img=255.*img;
            sp_temp=superPixels(:,idx);
            is_mem=ismember(labelledlevelvideo(:,:,frame),sp_temp);
            img=img.*is_mem;
            img = (cat(3,img,img,img));
            %imshow(img);
            imwrite(img,['./coloring3/',num2str(frame),'.jpg']);
        end
    end
    
    
    
end
