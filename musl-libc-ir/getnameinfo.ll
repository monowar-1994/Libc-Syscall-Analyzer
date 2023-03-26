; ModuleID = 'src/network/getnameinfo.c'
source_filename = "src/network/getnameinfo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr = type { i16, [14 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%struct.address = type { i32, i32, [16 x i8], i32 }

@.str = private unnamed_addr constant [13 x i8] c"\00\00\00\00\00\00\00\00\00\00\FF\FF\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"%d.%d.%d.%d.in-addr.arpa\00", align 1
@mkptr6.xdigits = internal unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 16
@.str.2 = private unnamed_addr constant [9 x i8] c"ip6.arpa\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"/etc/hosts\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"/etc/services\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"/udp\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"/tcp\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @getnameinfo(%struct.sockaddr* noalias noundef %0, i32 noundef %1, i8* noalias noundef %2, i32 noundef %3, i8* noalias noundef %4, i32 noundef %5, i32 noundef %6) local_unnamed_addr #0 {
  %8 = alloca [128 x i8], align 16
  %9 = alloca i8*, align 8
  %10 = alloca [1032 x i8], align 16
  %11 = alloca %struct._IO_FILE, align 8
  %12 = alloca [512 x i8], align 16
  %13 = alloca [1032 x i8], align 16
  %14 = alloca [16 x i8], align 16
  %15 = alloca %struct.address, align 4
  %16 = alloca %struct._IO_FILE, align 8
  %17 = alloca [78 x i8], align 16
  %18 = alloca [256 x i8], align 16
  %19 = alloca [13 x i8], align 1
  %20 = alloca [96 x i8], align 16
  %21 = alloca [512 x i8], align 16
  %22 = alloca [17 x i8], align 16
  %23 = getelementptr inbounds [78 x i8], [78 x i8]* %17, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 78, i8* nonnull %23) #3
  %24 = getelementptr inbounds [256 x i8], [256 x i8]* %18, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %24) #3
  %25 = getelementptr inbounds [13 x i8], [13 x i8]* %19, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 13, i8* nonnull %25) #3
  %26 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 0, i32 0
  %27 = load i16, i16* %26, align 2, !tbaa !3
  %28 = zext i16 %27 to i32
  switch i16 %27, label %349 [
    i16 2, label %29
    i16 10, label %45
  ]

29:                                               ; preds = %7
  %30 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 0, i32 1, i64 2
  %31 = icmp ult i32 %1, 16
  br i1 %31, label %349, label %32

32:                                               ; preds = %29
  %33 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 0, i32 1, i64 5
  %34 = load i8, i8* %33, align 1, !tbaa !8
  %35 = zext i8 %34 to i32
  %36 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 0, i32 1, i64 4
  %37 = load i8, i8* %36, align 1, !tbaa !8
  %38 = zext i8 %37 to i32
  %39 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 0, i32 1, i64 3
  %40 = load i8, i8* %39, align 1, !tbaa !8
  %41 = zext i8 %40 to i32
  %42 = load i8, i8* %30, align 1, !tbaa !8
  %43 = zext i8 %42 to i32
  %44 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef nonnull %23, i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i32 noundef %35, i32 noundef %38, i32 noundef %41, i32 noundef %43) #4
  br label %90

45:                                               ; preds = %7
  %46 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 0, i32 1, i64 6
  %47 = icmp ult i32 %1, 28
  br i1 %47, label %349, label %48

48:                                               ; preds = %45
  %49 = tail call i32 @memcmp(i8* noundef nonnull %46, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 noundef 12) #4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %72, label %51

51:                                               ; preds = %48, %51
  %52 = phi i64 [ %68, %51 ], [ 15, %48 ]
  %53 = phi i8* [ %67, %51 ], [ %23, %48 ]
  %54 = getelementptr inbounds i8, i8* %46, i64 %52
  %55 = load i8, i8* %54, align 1, !tbaa !8
  %56 = and i8 %55, 15
  %57 = zext i8 %56 to i64
  %58 = getelementptr inbounds [17 x i8], [17 x i8]* @mkptr6.xdigits, i64 0, i64 %57
  %59 = load i8, i8* %58, align 1, !tbaa !8
  %60 = getelementptr inbounds i8, i8* %53, i64 1
  store i8 %59, i8* %53, align 1, !tbaa !8
  %61 = getelementptr inbounds i8, i8* %53, i64 2
  store i8 46, i8* %60, align 1, !tbaa !8
  %62 = lshr i8 %55, 4
  %63 = zext i8 %62 to i64
  %64 = getelementptr inbounds [17 x i8], [17 x i8]* @mkptr6.xdigits, i64 0, i64 %63
  %65 = load i8, i8* %64, align 1, !tbaa !8
  %66 = getelementptr inbounds i8, i8* %53, i64 3
  store i8 %65, i8* %61, align 1, !tbaa !8
  %67 = getelementptr inbounds i8, i8* %53, i64 4
  store i8 46, i8* %66, align 1, !tbaa !8
  %68 = add nsw i64 %52, -1
  %69 = icmp eq i64 %52, 0
  br i1 %69, label %70, label %51

70:                                               ; preds = %51
  %71 = call i8* @strcpy(i8* noundef nonnull %67, i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0)) #4
  br label %86

72:                                               ; preds = %48
  %73 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 0, i32 1, i64 18
  %74 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 0, i32 1, i64 21
  %75 = load i8, i8* %74, align 1, !tbaa !8
  %76 = zext i8 %75 to i32
  %77 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 0, i32 1, i64 20
  %78 = load i8, i8* %77, align 1, !tbaa !8
  %79 = zext i8 %78 to i32
  %80 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 0, i32 1, i64 19
  %81 = load i8, i8* %80, align 1, !tbaa !8
  %82 = zext i8 %81 to i32
  %83 = load i8, i8* %73, align 1, !tbaa !8
  %84 = zext i8 %83 to i32
  %85 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef nonnull %23, i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i64 0, i64 0), i32 noundef %76, i32 noundef %79, i32 noundef %82, i32 noundef %84) #4
  br label %86

86:                                               ; preds = %72, %70
  %87 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 1, i32 1, i64 6
  %88 = bitcast i8* %87 to i32*
  %89 = load i32, i32* %88, align 4, !tbaa !9
  br label %90

90:                                               ; preds = %86, %32
  %91 = phi i32 [ %89, %86 ], [ 0, %32 ]
  %92 = phi i8* [ %46, %86 ], [ %30, %32 ]
  %93 = icmp ne i8* %2, null
  %94 = icmp ne i32 %3, 0
  %95 = and i1 %93, %94
  br i1 %95, label %96, label %257

96:                                               ; preds = %90
  store i8 0, i8* %24, align 16, !tbaa !8
  %97 = and i32 %6, 1
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %210

99:                                               ; preds = %96
  %100 = getelementptr inbounds [512 x i8], [512 x i8]* %12, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %100) #3
  %101 = getelementptr inbounds [1032 x i8], [1032 x i8]* %13, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1032, i8* nonnull %101) #3
  %102 = getelementptr inbounds [16 x i8], [16 x i8]* %14, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %102) #3
  %103 = bitcast %struct.address* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %103) #3
  %104 = bitcast %struct._IO_FILE* %16 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %104) #3
  %105 = call %struct._IO_FILE* @__fopen_rb_ca(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), %struct._IO_FILE* noundef nonnull %16, i8* noundef nonnull %101, i64 noundef 1032) #4
  %106 = icmp eq %struct._IO_FILE* %105, null
  br i1 %106, label %195, label %107

107:                                              ; preds = %99
  %108 = icmp eq i16 %27, 2
  br i1 %108, label %109, label %113

109:                                              ; preds = %107
  %110 = getelementptr inbounds [16 x i8], [16 x i8]* %14, i64 0, i64 12
  %111 = call i8* @memcpy(i8* noundef nonnull %110, i8* noundef nonnull %92, i64 noundef 4) #4
  %112 = call i8* @memcpy(i8* noundef nonnull %102, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 noundef 12) #4
  br label %113

113:                                              ; preds = %109, %107
  %114 = phi i8* [ %102, %109 ], [ %92, %107 ]
  %115 = call i8* @fgets(i8* noundef nonnull %100, i32 noundef 512, %struct._IO_FILE* noundef nonnull %105) #4
  %116 = icmp eq i8* %115, null
  br i1 %116, label %193, label %117

117:                                              ; preds = %113
  %118 = getelementptr inbounds %struct.address, %struct.address* %15, i64 0, i32 0
  %119 = getelementptr inbounds %struct.address, %struct.address* %15, i64 0, i32 2, i64 0
  %120 = getelementptr inbounds %struct.address, %struct.address* %15, i64 0, i32 2, i64 12
  %121 = getelementptr inbounds %struct.address, %struct.address* %15, i64 0, i32 1
  br label %122

122:                                              ; preds = %146, %117
  %123 = call i8* @strchr(i8* noundef nonnull %100, i32 noundef 35) #4
  %124 = icmp eq i8* %123, null
  br i1 %124, label %127, label %125

125:                                              ; preds = %122
  %126 = getelementptr inbounds i8, i8* %123, i64 1
  store i8 10, i8* %123, align 1, !tbaa !8
  store i8 0, i8* %126, align 1, !tbaa !8
  br label %127

127:                                              ; preds = %125, %122
  %128 = load i8, i8* %100, align 16, !tbaa !8
  %129 = icmp eq i8 %128, 0
  br i1 %129, label %142, label %130

130:                                              ; preds = %127, %138
  %131 = phi i8 [ %140, %138 ], [ %128, %127 ]
  %132 = phi i8* [ %139, %138 ], [ %100, %127 ]
  %133 = sext i8 %131 to i32
  %134 = icmp ne i8 %131, 32
  %135 = add nsw i32 %133, -14
  %136 = icmp ult i32 %135, -5
  %137 = and i1 %134, %136
  br i1 %137, label %138, label %142

138:                                              ; preds = %130
  %139 = getelementptr inbounds i8, i8* %132, i64 1
  %140 = load i8, i8* %139, align 1, !tbaa !8
  %141 = icmp eq i8 %140, 0
  br i1 %141, label %142, label %130

142:                                              ; preds = %138, %130, %127
  %143 = phi i8* [ %100, %127 ], [ %132, %130 ], [ %139, %138 ]
  store i8 0, i8* %143, align 1, !tbaa !8
  %144 = call i32 @__lookup_ipliteral(%struct.address* noundef nonnull %15, i8* noundef nonnull %100, i32 noundef 0) #4
  %145 = icmp slt i32 %144, 1
  br i1 %145, label %146, label %149

146:                                              ; preds = %184, %155, %142
  %147 = call i8* @fgets(i8* noundef nonnull %100, i32 noundef 512, %struct._IO_FILE* noundef nonnull %105) #4
  %148 = icmp eq i8* %147, null
  br i1 %148, label %193, label %122

149:                                              ; preds = %142
  %150 = load i32, i32* %118, align 4, !tbaa !13
  %151 = icmp eq i32 %150, 2
  br i1 %151, label %152, label %155

152:                                              ; preds = %149
  %153 = call i8* @memcpy(i8* noundef nonnull %120, i8* noundef nonnull %119, i64 noundef 4) #4
  %154 = call i8* @memcpy(i8* noundef nonnull %119, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 noundef 12) #4
  store i32 0, i32* %121, align 4, !tbaa !15
  br label %155

155:                                              ; preds = %152, %149
  %156 = call i32 @memcmp(i8* noundef %114, i8* noundef nonnull %119, i64 noundef 16) #4
  %157 = icmp eq i32 %156, 0
  %158 = load i32, i32* %121, align 4
  %159 = icmp eq i32 %158, %91
  %160 = select i1 %157, i1 %159, i1 false
  br i1 %160, label %161, label %146

161:                                              ; preds = %155, %166
  %162 = phi i8* [ %163, %166 ], [ %143, %155 ]
  %163 = getelementptr inbounds i8, i8* %162, i64 1
  %164 = load i8, i8* %163, align 1, !tbaa !8
  %165 = icmp eq i8 %164, 0
  br i1 %165, label %184, label %166

166:                                              ; preds = %161
  %167 = sext i8 %164 to i32
  %168 = icmp ne i8 %164, 32
  %169 = add nsw i32 %167, -14
  %170 = icmp ult i32 %169, -5
  %171 = and i1 %168, %170
  br i1 %171, label %172, label %161

172:                                              ; preds = %166, %180
  %173 = phi i8 [ %182, %180 ], [ %164, %166 ]
  %174 = phi i8* [ %181, %180 ], [ %163, %166 ]
  %175 = sext i8 %173 to i32
  %176 = icmp ne i8 %173, 32
  %177 = add nsw i32 %175, -14
  %178 = icmp ult i32 %177, -5
  %179 = and i1 %176, %178
  br i1 %179, label %180, label %184

180:                                              ; preds = %172
  %181 = getelementptr inbounds i8, i8* %174, i64 1
  %182 = load i8, i8* %181, align 1, !tbaa !8
  %183 = icmp eq i8 %182, 0
  br i1 %183, label %184, label %172

184:                                              ; preds = %161, %180, %172
  %185 = phi i8* [ %174, %172 ], [ %181, %180 ], [ %163, %161 ]
  store i8 0, i8* %185, align 1, !tbaa !8
  %186 = ptrtoint i8* %185 to i64
  %187 = ptrtoint i8* %163 to i64
  %188 = sub i64 %186, %187
  %189 = icmp slt i64 %188, 256
  br i1 %189, label %190, label %146

190:                                              ; preds = %184
  %191 = add nsw i64 %188, 1
  %192 = call i8* @memcpy(i8* noundef nonnull %24, i8* noundef nonnull %163, i64 noundef %191) #4
  br label %193

193:                                              ; preds = %146, %190, %113
  %194 = call i32 @__fclose_ca(%struct._IO_FILE* noundef nonnull %105) #4
  br label %195

195:                                              ; preds = %193, %99
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %104) #3
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %103) #3
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %102) #3
  call void @llvm.lifetime.end.p0i8(i64 1032, i8* nonnull %101) #3
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %100) #3
  %196 = load i8, i8* %24, align 16, !tbaa !8
  %197 = icmp eq i8 %196, 0
  br i1 %197, label %198, label %251

198:                                              ; preds = %195
  %199 = getelementptr inbounds [96 x i8], [96 x i8]* %20, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 96, i8* nonnull %199) #3
  %200 = getelementptr inbounds [512 x i8], [512 x i8]* %21, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %200) #3
  %201 = call i32 @__res_mkquery(i32 noundef 0, i8* noundef nonnull %23, i32 noundef 1, i32 noundef 12, i8* noundef null, i32 noundef 0, i8* noundef null, i8* noundef nonnull %199, i32 noundef 96) #4
  %202 = getelementptr inbounds [96 x i8], [96 x i8]* %20, i64 0, i64 3
  store i8 0, i8* %202, align 1, !tbaa !8
  %203 = call i32 @__res_send(i8* noundef nonnull %199, i32 noundef %201, i8* noundef nonnull %200, i32 noundef 512) #4
  store i8 0, i8* %24, align 16, !tbaa !8
  %204 = icmp sgt i32 %203, 0
  br i1 %204, label %206, label %205

205:                                              ; preds = %198
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %200) #3
  call void @llvm.lifetime.end.p0i8(i64 96, i8* nonnull %199) #3
  br label %210

206:                                              ; preds = %198
  %207 = call i32 @__dns_parse(i8* noundef nonnull %200, i32 noundef %203, i32 (i8*, i32, i8*, i32, i8*)* noundef nonnull @dns_parse_callback, i8* noundef nonnull %24) #4
  %208 = load i8, i8* %24, align 16, !tbaa !8
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %200) #3
  call void @llvm.lifetime.end.p0i8(i64 96, i8* nonnull %199) #3
  %209 = icmp eq i8 %208, 0
  br i1 %209, label %210, label %251

210:                                              ; preds = %205, %96, %206
  %211 = and i32 %6, 8
  %212 = icmp eq i32 %211, 0
  br i1 %212, label %213, label %349

213:                                              ; preds = %210
  %214 = call i8* @inet_ntop(i32 noundef %28, i8* noundef nonnull %92, i8* noundef nonnull %24, i32 noundef 256) #4
  %215 = icmp eq i32 %91, 0
  br i1 %215, label %251, label %216

216:                                              ; preds = %213
  %217 = getelementptr inbounds [17 x i8], [17 x i8]* %22, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 17, i8* nonnull %217) #3
  %218 = and i32 %6, 256
  %219 = icmp eq i32 %218, 0
  br i1 %219, label %220, label %236

220:                                              ; preds = %216
  %221 = load i8, i8* %92, align 1, !tbaa !8
  switch i8 %221, label %236 [
    i8 -2, label %222
    i8 -1, label %227
  ]

222:                                              ; preds = %220
  %223 = getelementptr inbounds i8, i8* %92, i64 1
  %224 = load i8, i8* %223, align 1, !tbaa !8
  %225 = and i8 %224, -64
  %226 = icmp eq i8 %225, -128
  br i1 %226, label %232, label %236

227:                                              ; preds = %220
  %228 = getelementptr inbounds i8, i8* %92, i64 1
  %229 = load i8, i8* %228, align 1, !tbaa !8
  %230 = and i8 %229, 15
  %231 = icmp eq i8 %230, 2
  br i1 %231, label %232, label %236

232:                                              ; preds = %222, %227
  %233 = getelementptr inbounds [17 x i8], [17 x i8]* %22, i64 0, i64 1
  %234 = call i8* @if_indextoname(i32 noundef %91, i8* noundef nonnull %233) #4
  %235 = icmp eq i8* %234, null
  br i1 %235, label %236, label %247

236:                                              ; preds = %220, %222, %227, %216, %232
  %237 = getelementptr inbounds [13 x i8], [13 x i8]* %19, i64 0, i64 11
  store i8 0, i8* %237, align 1, !tbaa !8
  br label %238

238:                                              ; preds = %238, %236
  %239 = phi i8* [ %237, %236 ], [ %244, %238 ]
  %240 = phi i32 [ %91, %236 ], [ %245, %238 ]
  %241 = urem i32 %240, 10
  %242 = trunc i32 %241 to i8
  %243 = or i8 %242, 48
  %244 = getelementptr inbounds i8, i8* %239, i64 -1
  store i8 %243, i8* %244, align 1, !tbaa !8
  %245 = udiv i32 %240, 10
  %246 = icmp ult i32 %240, 10
  br i1 %246, label %247, label %238

247:                                              ; preds = %238, %232
  %248 = phi i8* [ %234, %232 ], [ %244, %238 ]
  %249 = getelementptr inbounds i8, i8* %248, i64 -1
  store i8 37, i8* %249, align 1, !tbaa !8
  %250 = call i8* @strcat(i8* noundef nonnull %24, i8* noundef nonnull %249) #4
  call void @llvm.lifetime.end.p0i8(i64 17, i8* nonnull %217) #3
  br label %251

251:                                              ; preds = %195, %213, %247, %206
  %252 = call i64 @strlen(i8* noundef nonnull %24) #4
  %253 = zext i32 %3 to i64
  %254 = icmp ult i64 %252, %253
  br i1 %254, label %255, label %349

255:                                              ; preds = %251
  %256 = call i8* @strcpy(i8* noundef nonnull %2, i8* noundef nonnull %24) #4
  br label %257

257:                                              ; preds = %255, %90
  %258 = icmp ne i8* %4, null
  %259 = icmp ne i32 %5, 0
  %260 = and i1 %258, %259
  br i1 %260, label %261, label %349

261:                                              ; preds = %257
  %262 = getelementptr inbounds %struct.sockaddr, %struct.sockaddr* %0, i64 0, i32 1
  %263 = bitcast [14 x i8]* %262 to i16*
  %264 = load i16, i16* %263, align 2, !tbaa !16
  %265 = call zeroext i16 @ntohs(i16 noundef zeroext %264) #4
  %266 = zext i16 %265 to i32
  store i8 0, i8* %24, align 16, !tbaa !8
  %267 = and i32 %6, 2
  %268 = icmp eq i32 %267, 0
  br i1 %268, label %269, label %331

269:                                              ; preds = %261
  %270 = and i32 %6, 16
  %271 = getelementptr inbounds [128 x i8], [128 x i8]* %8, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %271) #3
  %272 = bitcast i8** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %272) #3
  %273 = getelementptr inbounds [1032 x i8], [1032 x i8]* %10, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1032, i8* nonnull %273) #3
  %274 = bitcast %struct._IO_FILE* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %274) #3
  %275 = call %struct._IO_FILE* @__fopen_rb_ca(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), %struct._IO_FILE* noundef nonnull %11, i8* noundef nonnull %273, i64 noundef 1032) #4
  %276 = icmp eq %struct._IO_FILE* %275, null
  br i1 %276, label %328, label %277

277:                                              ; preds = %269
  %278 = call i8* @fgets(i8* noundef nonnull %271, i32 noundef 128, %struct._IO_FILE* noundef nonnull %275) #4
  %279 = icmp eq i8* %278, null
  br i1 %279, label %326, label %280

280:                                              ; preds = %277
  %281 = zext i16 %265 to i64
  %282 = icmp eq i32 %270, 0
  %283 = ptrtoint [128 x i8]* %8 to i64
  br label %284

284:                                              ; preds = %310, %280
  %285 = call i8* @strchr(i8* noundef nonnull %271, i32 noundef 35) #4
  %286 = icmp eq i8* %285, null
  br i1 %286, label %289, label %287

287:                                              ; preds = %284
  %288 = getelementptr inbounds i8, i8* %285, i64 1
  store i8 10, i8* %285, align 1, !tbaa !8
  store i8 0, i8* %288, align 1, !tbaa !8
  br label %289

289:                                              ; preds = %287, %284
  %290 = load i8, i8* %271, align 16, !tbaa !8
  %291 = icmp eq i8 %290, 0
  br i1 %291, label %310, label %292

292:                                              ; preds = %289, %301
  %293 = phi i8 [ %302, %301 ], [ %290, %289 ]
  %294 = phi i8* [ %300, %301 ], [ %271, %289 ]
  %295 = sext i8 %293 to i32
  %296 = icmp ne i8 %293, 32
  %297 = add nsw i32 %295, -14
  %298 = icmp ult i32 %297, -5
  %299 = and i1 %296, %298
  %300 = getelementptr inbounds i8, i8* %294, i64 1
  br i1 %299, label %301, label %304

301:                                              ; preds = %292
  %302 = load i8, i8* %300, align 1, !tbaa !8
  %303 = icmp eq i8 %302, 0
  br i1 %303, label %310, label %292

304:                                              ; preds = %292
  store i8 0, i8* %294, align 1, !tbaa !8
  %305 = call i64 @strtoul(i8* noundef nonnull %300, i8** noundef nonnull %9, i32 noundef 10) #4
  %306 = icmp eq i64 %305, %281
  br i1 %306, label %307, label %310

307:                                              ; preds = %304
  %308 = load i8*, i8** %9, align 8, !tbaa !19
  %309 = icmp eq i8* %308, %300
  br i1 %309, label %310, label %313

310:                                              ; preds = %301, %320, %317, %314, %307, %304, %289
  %311 = call i8* @fgets(i8* noundef nonnull %271, i32 noundef 128, %struct._IO_FILE* noundef nonnull %275) #4
  %312 = icmp eq i8* %311, null
  br i1 %312, label %326, label %284

313:                                              ; preds = %307
  br i1 %282, label %317, label %314

314:                                              ; preds = %313
  %315 = call i32 @strncmp(i8* noundef %308, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 noundef 4) #4
  %316 = icmp eq i32 %315, 0
  br i1 %316, label %320, label %310

317:                                              ; preds = %313
  %318 = call i32 @strncmp(i8* noundef %308, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 noundef 4) #4
  %319 = icmp eq i32 %318, 0
  br i1 %319, label %320, label %310

320:                                              ; preds = %317, %314
  %321 = ptrtoint i8* %300 to i64
  %322 = sub i64 %321, %283
  %323 = icmp sgt i64 %322, 32
  br i1 %323, label %310, label %324

324:                                              ; preds = %320
  %325 = call i8* @memcpy(i8* noundef nonnull %24, i8* noundef nonnull %271, i64 noundef %322) #4
  br label %326

326:                                              ; preds = %310, %324, %277
  %327 = call i32 @__fclose_ca(%struct._IO_FILE* noundef nonnull %275) #4
  br label %328

328:                                              ; preds = %326, %269
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %274) #3
  call void @llvm.lifetime.end.p0i8(i64 1032, i8* nonnull %273) #3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %272) #3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %271) #3
  %329 = load i8, i8* %24, align 16, !tbaa !8
  %330 = icmp eq i8 %329, 0
  br i1 %330, label %331, label %342

331:                                              ; preds = %261, %328
  %332 = getelementptr inbounds [13 x i8], [13 x i8]* %19, i64 0, i64 11
  store i8 0, i8* %332, align 1, !tbaa !8
  br label %333

333:                                              ; preds = %333, %331
  %334 = phi i8* [ %332, %331 ], [ %339, %333 ]
  %335 = phi i32 [ %266, %331 ], [ %340, %333 ]
  %336 = urem i32 %335, 10
  %337 = trunc i32 %336 to i8
  %338 = or i8 %337, 48
  %339 = getelementptr inbounds i8, i8* %334, i64 -1
  store i8 %338, i8* %339, align 1, !tbaa !8
  %340 = udiv i32 %335, 10
  %341 = icmp ult i32 %335, 10
  br i1 %341, label %342, label %333

342:                                              ; preds = %333, %328
  %343 = phi i8* [ %24, %328 ], [ %339, %333 ]
  %344 = call i64 @strlen(i8* noundef nonnull %343) #4
  %345 = zext i32 %5 to i64
  %346 = icmp ult i64 %344, %345
  br i1 %346, label %347, label %349

347:                                              ; preds = %342
  %348 = call i8* @strcpy(i8* noundef nonnull %4, i8* noundef nonnull %343) #4
  br label %349

349:                                              ; preds = %257, %347, %342, %251, %210, %7, %45, %29
  %350 = phi i32 [ -6, %29 ], [ -6, %45 ], [ -6, %7 ], [ -2, %210 ], [ -12, %251 ], [ -12, %342 ], [ 0, %347 ], [ 0, %257 ]
  call void @llvm.lifetime.end.p0i8(i64 13, i8* nonnull %25) #3
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %24) #3
  call void @llvm.lifetime.end.p0i8(i64 78, i8* nonnull %23) #3
  ret i32 %350
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__res_mkquery(i32 noundef, i8* noundef, i32 noundef, i32 noundef, i8* noundef, i32 noundef, i8* noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__res_send(i8* noundef, i32 noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__dns_parse(i8* noundef, i32 noundef, i32 (i8*, i32, i8*, i32, i8*)* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal i32 @dns_parse_callback(i8* noundef %0, i32 noundef %1, i8* noundef %2, i32 noundef %3, i8* noundef %4) #0 {
  %6 = icmp eq i32 %1, 12
  br i1 %6, label %7, label %12

7:                                                ; preds = %5
  %8 = getelementptr inbounds i8, i8* %4, i64 512
  %9 = tail call i32 @__dn_expand(i8* noundef %4, i8* noundef nonnull %8, i8* noundef %2, i8* noundef %0, i32 noundef 256) #4
  %10 = icmp slt i32 %9, 1
  br i1 %10, label %11, label %12

11:                                               ; preds = %7
  store i8 0, i8* %0, align 1, !tbaa !8
  br label %12

12:                                               ; preds = %7, %11, %5
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @inet_ntop(i32 noundef, i8* noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @if_indextoname(i32 noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strcat(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strcpy(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare zeroext i16 @ntohs(i16 noundef zeroext) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sprintf(i8* noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__fopen_rb_ca(i8* noundef, %struct._IO_FILE* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__lookup_ipliteral(%struct.address* noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__fclose_ca(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__dn_expand(i8* noundef, i8* noundef, i8* noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"sockaddr", !5, i64 0, !6, i64 2}
!5 = !{!"short", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = !{!10, !11, i64 24}
!10 = !{!"sockaddr_in6", !5, i64 0, !5, i64 2, !11, i64 4, !12, i64 8, !11, i64 24}
!11 = !{!"int", !6, i64 0}
!12 = !{!"in6_addr", !6, i64 0}
!13 = !{!14, !11, i64 0}
!14 = !{!"address", !11, i64 0, !11, i64 4, !6, i64 8, !11, i64 24}
!15 = !{!14, !11, i64 4}
!16 = !{!17, !5, i64 2}
!17 = !{!"sockaddr_in", !5, i64 0, !5, i64 2, !18, i64 4, !6, i64 8}
!18 = !{!"in_addr", !11, i64 0}
!19 = !{!20, !20, i64 0}
!20 = !{!"any pointer", !6, i64 0}
