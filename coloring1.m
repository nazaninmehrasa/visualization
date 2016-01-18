%function coloring1( frame_numbers, superPixels)
frame_numbers=[1 2];
superPixels=[1 1;321 12];
load('vw_commercial_vidinfo.mat')
load('/cs/vml2/nmehrasa/eccv16/code/similarities.mat')
load('allsegsvw_commercial.mat')


count=0;
for frame = 1:21
    idx=find(frame_numbers==frame);
    if(~isempty(idx))
       % figure;
        img=zeros(360,640);
        img = (cat(3,img,img,img));
        sp_temp=superPixels(:,idx);
        for i=1:360
            for j=1:640
                sp_idx=(find(sp_temp==labelledlevelvideo(i,j,frame)));
                if(~isempty(sp_idx))
                   count=count+1;
                    img(i,j,1)=255;
                    img(i,j,2)=255;
                    img(i,j,3)=255;
                end
            end
        end
        %imshow(img);
        imwrite(img,['./coloring/',num2str(frame),'.jpg']);
    end
end
