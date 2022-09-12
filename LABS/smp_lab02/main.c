#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#define LIMIAR 128
#define _height 720
#define _width 1280

#define _bitsperpixel 24
#define _planes 1
#define _compression 0
#define _pixelbytesize _height*_width*_bitsperpixel/8
#define _filesize _pixelbytesize+sizeof(bitmap)
#define _xpixelpermeter 0x130B //2835 , 72 DPI
#define _ypixelpermeter 0x130B //2835 , 72 DPI
#define pixel 0xFF
#pragma pack(push,1)
typedef struct{
    uint8_t signature[2];
    uint32_t filesize;
    uint32_t reserved;
    uint32_t fileoffset_to_pixelarray;
} fileheader;
typedef struct{
    uint32_t dibheadersize;
    uint32_t width;
    uint32_t height;
    uint16_t planes;
    uint16_t bitsperpixel;
    uint32_t compression;
    uint32_t imagesize;
    uint32_t ypixelpermeter;
    uint32_t xpixelpermeter;
    uint32_t numcolorspallette;
    uint32_t mostimpcolor;
} bitmapinfoheader;
typedef struct {
    fileheader fileheader;
    bitmapinfoheader bitmapinfoheader;
} bitmap;
#pragma pack(pop)



//
// funcao para ler ficheiro de imagem pgm
//
unsigned char **readpgm(char *filename,int *width,int *height)
{
    unsigned char **p;
    unsigned char *data;
    int i,j,datasize,c;
    int typeno,maxvalue;
    char dumchar;
    FILE *fp;
    
    //fprintf(stderr,"readpgm: opening %s\n",filename);
    
    fp=fopen(filename,"rb"); /* 2nd parameter must be equal to "rb" in Windows! */
    if(!fp) {
	fprintf(stderr,"readpgm: error opening file\n");
	exit(0);
    }
    
    if(fscanf(fp,"P%d\n",&typeno)!=1) {
	fprintf(stderr,"readpgm: error reading typeno\n");
	exit(0);
    }
    
    //fprintf(stderr,"readpgm: ppm type P%d\n",typeno);
    
    while(fscanf(fp,"#%c",&dumchar)) {
	while(fscanf(fp,"%c",&dumchar),dumchar!='\n') printf("%c",dumchar);
	printf("\n");
    }
    
    if(fscanf(fp,"%d %d\n",width,height)!=2) {
	fprintf(stderr,"readpgm: error reading width,height\n");
	exit(0);
    }
    
    if(fscanf(fp,"%d",&maxvalue)!=1) {
	fprintf(stderr,"readpgm: error reading maxvalue\n");
	exit(0);
    }

/* fix 14.10.97: read newline separately to avoid skipping bytes of
   image data corresponding to form-feeds
*/
    fgetc(fp);

    //fprintf(stderr,"readpgm: w %d  h %d  mv %d\n",*width,*height,maxvalue);
    
    datasize=(*width)*(*height);
    
    switch(typeno) {

    case 5:        /*  rawbits pgm type */
	
	p=(unsigned char **)calloc((*height),sizeof(unsigned char *));
	if(!p) {
	    fprintf(stderr,"readppm: calloc error 1\n");
	    exit(0);
	}
	for(i=0;i<(*height);i++) {
	    p[i]=(unsigned char *)calloc((*width),sizeof(unsigned char));
	    if(!p[i]) {
		fprintf(stderr,"readppm: calloc error 2\n");
		exit(0);
	    }
	}
	data=(unsigned char *)calloc(datasize,sizeof(unsigned char));
	if(!data) {
	    fprintf(stderr,"readppm: calloc error 3\n");
	    exit(0);
	}
	if(fread(data,sizeof(unsigned char),datasize,fp)!=datasize) {
	    fprintf(stderr,"readppm: error reading data\n");
	    exit(0);
	}
	
	c=0;
	for(i=0;i<(*height);i++)
	    for(j=0;j<(*width);j++)
		p[i][j]=data[c++];
	
	free(data);
	break;
    default:
	fprintf(stderr,"readppm: sorry ppm type not implemented\n");
	exit(0);
    }

    fclose(fp);
    
    return p;
}

//
// funcao para escrever ficheiro de imagem pgm
//	
void writepgm(unsigned char **p, int width, int height, char *filename)
{
    unsigned char *data,*dp;
    int c,i,j,datasize,level;
    FILE *fp;

    if(!(fp=fopen(filename,"wb"))) { /* 2nd parameter must be equal to "rb" in Windows! */
	fprintf(stderr,"writepgm: error opening output file\n");
	exit(0);
    }
  
    fprintf(fp,"P5\n");
    
    fprintf(fp,"%d %d\n",width,height);
   
    fprintf(fp,"%d\n",255);
    
    datasize=width*height;

    
    if(!(data=(unsigned char *)calloc(sizeof(char),datasize))){
	fprintf(stderr,"writepgm: calloc error\n");
	exit(0);
    }
    
    dp=data;
    for(i=0;i<height;i++)
      for(j=0;j<width;j++){
	    *dp++=p[i][j];
      }
    if(!fwrite(data,sizeof(unsigned char),datasize,fp)) {
	fprintf(stderr,"writepgm: write error\n");
	exit(0);
    }
    
    free(data);

    fclose(fp);
}

//
// funcao para escrever uma imagem .bmp
//
void writebmp(unsigned char **p, int width, int height, char *filename) {

    FILE *fp = fopen(filename,"wb");
    int i,j; 
    bitmap *pbitmap  = (bitmap*)calloc(1,sizeof(bitmap));
    uint8_t *pixelbuffer = (uint8_t*)malloc(_pixelbytesize);
    //strcpy(pbitmap->fileheader.signature,"BM");
    *(pbitmap->fileheader.signature)='B';
    *(pbitmap->fileheader.signature+1)='M';

    pbitmap->fileheader.filesize = _filesize;
    pbitmap->fileheader.fileoffset_to_pixelarray = sizeof(bitmap);
    pbitmap->bitmapinfoheader.dibheadersize =sizeof(bitmapinfoheader);
    pbitmap->bitmapinfoheader.width = _width;
    pbitmap->bitmapinfoheader.height = _height;
    pbitmap->bitmapinfoheader.planes = _planes;
    pbitmap->bitmapinfoheader.bitsperpixel = _bitsperpixel;
    pbitmap->bitmapinfoheader.compression = _compression;
    pbitmap->bitmapinfoheader.imagesize = _pixelbytesize;
    pbitmap->bitmapinfoheader.ypixelpermeter = _ypixelpermeter ;
    pbitmap->bitmapinfoheader.xpixelpermeter = _xpixelpermeter ;
    pbitmap->bitmapinfoheader.numcolorspallette = 0;
    fwrite (pbitmap, 1, sizeof(bitmap),fp);

    //memset(pixelbuffer,*p,_pixelbytesize);

    char *pbmp=(char *)pixelbuffer;
    for (i=0; i<height; i++)
	for (j=0; j<width; j++)
    	{
		*pbmp=p[i][j];
		*(pbmp+1)=p[i][j];
		*(pbmp+2)=p[i][j];
		pbmp+=3; 
	}

    fwrite(pixelbuffer,1,_pixelbytesize,fp);
    fclose(fp);
    free(pbitmap);
    free(pixelbuffer);

}



//
// funcao de binarizacao
//
void bin_img(unsigned char *ptr, int w, int h, unsigned char limiar);


//
// Programa de binarizacao de imagens, que recebe o nome
// dos ficheiros pela linha de comando
//	
int main(int argc, char **argv){
  int height, width, i, j, datasize;
  unsigned char **imptr, *dp;

  imptr=readpgm(argv[1],&width,&height);
  
  datasize=width*height;
  if(!(dp=(unsigned char *)calloc(sizeof(char),datasize))){
	fprintf(stderr,"writepgm: calloc error\n");
	exit(0);
    }
  for (i=0;i<height;i++)
    for (j=0;j<width;j++)
      dp[i*width+j]=imptr[i][j];


  bin_img(dp, width, height, LIMIAR);
  

  for(i=0;i<height;i++)
      for(j=0;j<width;j++)
	imptr[i][j]=dp[i*width+j];

  //writepgm(imptr,width,height,argv[2]);
  writebmp(imptr,width,height,argv[2]);
}
