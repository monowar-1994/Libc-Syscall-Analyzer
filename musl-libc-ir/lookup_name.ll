; ModuleID = 'src/network/lookup_name.c'
source_filename = "src/network/lookup_name.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.anon = type { i32, i32 }
%struct.policy = type { [16 x i8], i8, i8, i8, i8 }
%struct.address = type { i32, i32, [16 x i8], i32 }
%struct.resolvconf = type { [3 x %struct.address], i32, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%struct.sockaddr_in6 = type { i16, i16, i32, %struct.in6_addr, i32 }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.sockaddr = type { i16, [14 x i8] }
%struct.dpc_ctx = type { %struct.address*, i8*, i32 }

@.str = private unnamed_addr constant [13 x i8] c"\00\00\00\00\00\00\00\00\00\00\FF\FF\00", align 1
@__const.__lookup_name.da4 = private unnamed_addr constant %struct.sockaddr_in { i16 2, i16 -1, %struct.in_addr zeroinitializer, [8 x i8] zeroinitializer }, align 4
@.str.1 = private unnamed_addr constant [11 x i8] c"/etc/hosts\00", align 1
@name_from_dns.afrr = internal unnamed_addr constant [2 x %struct.anon] [%struct.anon { i32 10, i32 1 }, %struct.anon { i32 2, i32 28 }], align 16
@defpolicy = internal constant [6 x %struct.policy] [%struct.policy { [16 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01", i8 15, i8 -1, i8 50, i8 0 }, %struct.policy { [16 x i8] c"\00\00\00\00\00\00\00\00\00\00\FF\FF\00\00\00\00", i8 11, i8 -1, i8 35, i8 4 }, %struct.policy { [16 x i8] c" \02\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i8 1, i8 -1, i8 30, i8 2 }, %struct.policy { [16 x i8] c" \01\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i8 3, i8 -1, i8 5, i8 5 }, %struct.policy { [16 x i8] c"\FC\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i8 0, i8 -2, i8 3, i8 13 }, %struct.policy { [16 x i8] zeroinitializer, i8 0, i8 0, i8 40, i8 1 }], align 16

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__lookup_name(%struct.address* noundef align 4 dereferenceable(1344) %0, i8* noundef align 1 dereferenceable(256) %1, i8* noundef %2, i32 noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = alloca [256 x i8], align 16
  %7 = alloca %struct.resolvconf, align 4
  %8 = alloca [512 x i8], align 16
  %9 = alloca [1032 x i8], align 16
  %10 = alloca %struct._IO_FILE, align 8
  %11 = alloca i32, align 4
  %12 = alloca %struct.sockaddr_in6, align 4
  %13 = alloca %struct.sockaddr_in6, align 4
  %14 = alloca %struct.sockaddr_in, align 4
  %15 = alloca %struct.sockaddr_in, align 4
  %16 = alloca i32, align 4
  store i8 0, i8* %1, align 1, !tbaa !3
  %17 = icmp eq i8* %2, null
  br i1 %17, label %25, label %18

18:                                               ; preds = %5
  %19 = tail call i64 @strnlen(i8* noundef nonnull %2, i64 noundef 255) #7
  %20 = add i64 %19, -255
  %21 = icmp ult i64 %20, -254
  br i1 %21, label %510, label %22

22:                                               ; preds = %18
  %23 = add nuw nsw i64 %19, 1
  %24 = tail call i8* @memcpy(i8* noundef nonnull %1, i8* noundef nonnull %2, i64 noundef %23) #7
  br label %25

25:                                               ; preds = %22, %5
  %26 = and i32 %4, 8
  %27 = icmp eq i32 %26, 0
  %28 = icmp eq i32 %3, 10
  %29 = add nsw i32 %4, -8
  %30 = select i1 %28, i32 0, i32 %3
  %31 = or i1 %28, %27
  %32 = select i1 %31, i32 %4, i32 %29
  %33 = select i1 %27, i32 %3, i32 %30
  br i1 %17, label %34, label %70

34:                                               ; preds = %25
  %35 = and i32 %32, 1
  %36 = icmp eq i32 %35, 0
  %37 = icmp eq i32 %33, 10
  br i1 %36, label %51, label %38

38:                                               ; preds = %34
  br i1 %37, label %44, label %39

39:                                               ; preds = %38
  %40 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 0
  store i32 2, i32* %40, align 4, !tbaa.struct !6
  %41 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 1
  %42 = bitcast i32* %41 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(24) %42, i8 0, i64 24, i1 false) #8
  %43 = icmp eq i32 %33, 2
  br i1 %43, label %312, label %44

44:                                               ; preds = %39, %38
  %45 = phi i32 [ 1, %39 ], [ 0, %38 ]
  %46 = add nuw nsw i32 %45, 1
  %47 = zext i32 %45 to i64
  %48 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %47, i32 0
  store i32 10, i32* %48, align 4, !tbaa.struct !6
  %49 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %47, i32 1
  %50 = bitcast i32* %49 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(24) %50, i8 0, i64 24, i1 false) #8
  br label %312

51:                                               ; preds = %34
  br i1 %37, label %61, label %52

52:                                               ; preds = %51
  %53 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 2, i64 4
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %53, i8 0, i64 16, i1 false) #8
  %54 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 0
  store i32 2, i32* %54, align 4, !tbaa.struct !6
  %55 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 1
  store i32 0, i32* %55, align 4, !tbaa.struct !9
  %56 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 2, i64 0
  store i8 127, i8* %56, align 4, !tbaa.struct !10
  %57 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 2, i64 1
  %58 = bitcast i8* %57 to i16*
  store i16 0, i16* %58, align 1, !tbaa.struct !11
  %59 = getelementptr inbounds %struct.address, %struct.address* %0, i64 0, i32 2, i64 3
  store i8 1, i8* %59, align 1, !tbaa.struct !12
  %60 = icmp eq i32 %33, 2
  br i1 %60, label %312, label %61

61:                                               ; preds = %52, %51
  %62 = phi i32 [ 1, %52 ], [ 0, %51 ]
  %63 = add nuw nsw i32 %62, 1
  %64 = zext i32 %62 to i64
  %65 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %64, i32 0
  store i32 10, i32* %65, align 4, !tbaa.struct !6
  %66 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %64, i32 1
  %67 = bitcast i32* %66 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(19) %67, i8 0, i64 19, i1 false) #8
  %68 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %64, i32 2, i64 15
  store i8 1, i8* %68, align 1, !tbaa.struct !13
  %69 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %64, i32 3
  store i32 0, i32* %69, align 4, !tbaa.struct !14
  br label %312

70:                                               ; preds = %25
  %71 = tail call i32 @__lookup_ipliteral(%struct.address* noundef nonnull %0, i8* noundef nonnull %2, i32 noundef %33) #7
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %306

73:                                               ; preds = %70
  %74 = and i32 %32, 4
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %311

76:                                               ; preds = %73
  %77 = getelementptr inbounds [512 x i8], [512 x i8]* %8, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %77) #9
  %78 = tail call i64 @strlen(i8* noundef nonnull %2) #7
  %79 = getelementptr inbounds [1032 x i8], [1032 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1032, i8* nonnull %79) #9
  %80 = bitcast %struct._IO_FILE* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 232, i8* nonnull %80) #9
  %81 = call %struct._IO_FILE* @__fopen_rb_ca(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), %struct._IO_FILE* noundef nonnull %10, i8* noundef nonnull %79, i64 noundef 1032) #7
  %82 = icmp eq %struct._IO_FILE* %81, null
  br i1 %82, label %90, label %83

83:                                               ; preds = %76
  %84 = call i8* @fgets(i8* noundef nonnull %77, i32 noundef 512, %struct._IO_FILE* noundef nonnull %81) #7
  %85 = icmp eq i8* %84, null
  br i1 %85, label %86, label %88

86:                                               ; preds = %83
  %87 = call i32 @__fclose_ca(%struct._IO_FILE* noundef nonnull %81) #7
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %80) #9
  call void @llvm.lifetime.end.p0i8(i64 1032, i8* nonnull %79) #9
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %77) #9
  br label %200

88:                                               ; preds = %83
  %89 = getelementptr inbounds [512 x i8], [512 x i8]* %8, i64 0, i64 1
  br label %93

90:                                               ; preds = %76
  %91 = tail call i32* @___errno_location() #10
  %92 = load i32, i32* %91, align 4, !tbaa !7
  switch i32 %92, label %195 [
    i32 2, label %197
    i32 20, label %197
    i32 13, label %197
  ]

93:                                               ; preds = %184, %88
  %94 = phi i32 [ 0, %88 ], [ %187, %184 ]
  %95 = phi i32 [ 0, %88 ], [ %186, %184 ]
  %96 = phi i32 [ 0, %88 ], [ %185, %184 ]
  %97 = call i8* @strchr(i8* noundef nonnull %77, i32 noundef 35) #7
  %98 = icmp eq i8* %97, null
  br i1 %98, label %101, label %99

99:                                               ; preds = %93
  %100 = getelementptr inbounds i8, i8* %97, i64 1
  store i8 10, i8* %97, align 1, !tbaa !3
  store i8 0, i8* %100, align 1, !tbaa !3
  br label %101

101:                                              ; preds = %99, %93
  %102 = call i8* @strstr(i8* noundef nonnull %89, i8* noundef nonnull %2) #7
  %103 = icmp eq i8* %102, null
  br i1 %103, label %184, label %104

104:                                              ; preds = %101, %124
  %105 = phi i8* [ %126, %124 ], [ %102, %101 ]
  %106 = getelementptr inbounds i8, i8* %105, i64 -1
  %107 = load i8, i8* %106, align 1, !tbaa !3
  %108 = sext i8 %107 to i32
  %109 = icmp ne i8 %107, 32
  %110 = add nsw i32 %108, -14
  %111 = icmp ult i32 %110, -5
  %112 = and i1 %109, %111
  br i1 %112, label %124, label %113

113:                                              ; preds = %104
  %114 = getelementptr inbounds i8, i8* %105, i64 %78
  %115 = load i8, i8* %114, align 1, !tbaa !3
  %116 = sext i8 %115 to i32
  %117 = icmp ne i8 %115, 32
  %118 = add nsw i32 %116, -14
  %119 = icmp ult i32 %118, -5
  %120 = and i1 %117, %119
  br i1 %120, label %124, label %121

121:                                              ; preds = %113
  %122 = load i8, i8* %77, align 16, !tbaa !3
  %123 = icmp eq i8 %122, 0
  br i1 %123, label %140, label %128

124:                                              ; preds = %113, %104
  %125 = getelementptr inbounds i8, i8* %105, i64 1
  %126 = call i8* @strstr(i8* noundef nonnull %125, i8* noundef nonnull %2) #7
  %127 = icmp eq i8* %126, null
  br i1 %127, label %184, label %104

128:                                              ; preds = %121, %136
  %129 = phi i8 [ %138, %136 ], [ %122, %121 ]
  %130 = phi i8* [ %137, %136 ], [ %77, %121 ]
  %131 = sext i8 %129 to i32
  %132 = icmp ne i8 %129, 32
  %133 = add nsw i32 %131, -14
  %134 = icmp ult i32 %133, -5
  %135 = and i1 %132, %134
  br i1 %135, label %136, label %140

136:                                              ; preds = %128
  %137 = getelementptr inbounds i8, i8* %130, i64 1
  %138 = load i8, i8* %137, align 1, !tbaa !3
  %139 = icmp eq i8 %138, 0
  br i1 %139, label %140, label %128

140:                                              ; preds = %136, %128, %121
  %141 = phi i8* [ %77, %121 ], [ %130, %128 ], [ %137, %136 ]
  store i8 0, i8* %141, align 1, !tbaa !3
  %142 = sext i32 %96 to i64
  %143 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %142
  %144 = call i32 @__lookup_ipliteral(%struct.address* noundef nonnull %143, i8* noundef nonnull %77, i32 noundef %33) #7
  switch i32 %144, label %147 [
    i32 1, label %145
    i32 0, label %184
  ]

145:                                              ; preds = %140
  %146 = add nsw i32 %96, 1
  br label %147

147:                                              ; preds = %145, %140
  %148 = phi i32 [ %146, %145 ], [ %96, %140 ]
  %149 = phi i32 [ %95, %145 ], [ -2, %140 ]
  %150 = icmp eq i32 %94, 0
  br i1 %150, label %151, label %184

151:                                              ; preds = %147, %156
  %152 = phi i8* [ %153, %156 ], [ %141, %147 ]
  %153 = getelementptr inbounds i8, i8* %152, i64 1
  %154 = load i8, i8* %153, align 1, !tbaa !3
  %155 = icmp eq i8 %154, 0
  br i1 %155, label %174, label %156

156:                                              ; preds = %151
  %157 = sext i8 %154 to i32
  %158 = icmp ne i8 %154, 32
  %159 = add nsw i32 %157, -14
  %160 = icmp ult i32 %159, -5
  %161 = and i1 %158, %160
  br i1 %161, label %162, label %151

162:                                              ; preds = %156, %170
  %163 = phi i8 [ %172, %170 ], [ %154, %156 ]
  %164 = phi i8* [ %171, %170 ], [ %153, %156 ]
  %165 = sext i8 %163 to i32
  %166 = icmp ne i8 %163, 32
  %167 = add nsw i32 %165, -14
  %168 = icmp ult i32 %167, -5
  %169 = and i1 %166, %168
  br i1 %169, label %170, label %174

170:                                              ; preds = %162
  %171 = getelementptr inbounds i8, i8* %164, i64 1
  %172 = load i8, i8* %171, align 1, !tbaa !3
  %173 = icmp eq i8 %172, 0
  br i1 %173, label %174, label %162

174:                                              ; preds = %151, %170, %162
  %175 = phi i8* [ %164, %162 ], [ %171, %170 ], [ %153, %151 ]
  store i8 0, i8* %175, align 1, !tbaa !3
  %176 = call fastcc i32 @is_valid_hostname(i8* noundef nonnull %153) #7
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %184, label %178

178:                                              ; preds = %174
  %179 = ptrtoint i8* %175 to i64
  %180 = ptrtoint i8* %153 to i64
  %181 = sub i64 1, %180
  %182 = add i64 %181, %179
  %183 = call i8* @memcpy(i8* noundef nonnull %1, i8* noundef nonnull %153, i64 noundef %182) #7
  br label %184

184:                                              ; preds = %124, %178, %174, %147, %140, %101
  %185 = phi i32 [ %96, %140 ], [ %148, %147 ], [ %148, %178 ], [ %148, %174 ], [ %96, %101 ], [ %96, %124 ]
  %186 = phi i32 [ %95, %140 ], [ %149, %147 ], [ %149, %178 ], [ %149, %174 ], [ %95, %101 ], [ %95, %124 ]
  %187 = phi i32 [ %94, %140 ], [ 1, %147 ], [ 1, %178 ], [ 0, %174 ], [ %94, %101 ], [ %94, %124 ]
  %188 = call i8* @fgets(i8* noundef nonnull %77, i32 noundef 512, %struct._IO_FILE* noundef nonnull %81) #7
  %189 = icmp ne i8* %188, null
  %190 = icmp slt i32 %185, 48
  %191 = select i1 %189, i1 %190, i1 false
  br i1 %191, label %93, label %192

192:                                              ; preds = %184
  %193 = call i32 @__fclose_ca(%struct._IO_FILE* noundef nonnull %81) #7
  %194 = icmp eq i32 %185, 0
  br i1 %194, label %198, label %195

195:                                              ; preds = %192, %90
  %196 = phi i32 [ %185, %192 ], [ -11, %90 ]
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %80) #9
  call void @llvm.lifetime.end.p0i8(i64 1032, i8* nonnull %79) #9
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %77) #9
  br label %306

197:                                              ; preds = %90, %90, %90
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %80) #9
  call void @llvm.lifetime.end.p0i8(i64 1032, i8* nonnull %79) #9
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %77) #9
  br label %200

198:                                              ; preds = %192
  call void @llvm.lifetime.end.p0i8(i64 232, i8* nonnull %80) #9
  call void @llvm.lifetime.end.p0i8(i64 1032, i8* nonnull %79) #9
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %77) #9
  %199 = icmp eq i32 %186, 0
  br i1 %199, label %200, label %306

200:                                              ; preds = %86, %197, %198
  %201 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %201) #9
  %202 = bitcast %struct.resolvconf* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %202) #9
  %203 = call i32 @__get_resolv_conf(%struct.resolvconf* noundef nonnull %7, i8* noundef nonnull %201, i64 noundef 256) #7
  %204 = icmp slt i32 %203, 0
  br i1 %204, label %304, label %205

205:                                              ; preds = %200, %212
  %206 = phi i64 [ %214, %212 ], [ 0, %200 ]
  %207 = phi i64 [ %213, %212 ], [ 0, %200 ]
  %208 = getelementptr inbounds i8, i8* %2, i64 %206
  %209 = load i8, i8* %208, align 1, !tbaa !3
  switch i8 %209, label %212 [
    i8 0, label %215
    i8 46, label %210
  ]

210:                                              ; preds = %205
  %211 = add i64 %207, 1
  br label %212

212:                                              ; preds = %210, %205
  %213 = phi i64 [ %211, %210 ], [ %207, %205 ]
  %214 = add i64 %206, 1
  br label %205

215:                                              ; preds = %205
  %216 = getelementptr inbounds %struct.resolvconf, %struct.resolvconf* %7, i64 0, i32 3
  %217 = load i32, i32* %216, align 4, !tbaa !15
  %218 = zext i32 %217 to i64
  %219 = icmp ult i64 %207, %218
  %220 = add i64 %206, -1
  %221 = getelementptr inbounds i8, i8* %2, i64 %220
  %222 = load i8, i8* %221, align 1, !tbaa !3
  br i1 %219, label %223, label %225

223:                                              ; preds = %215
  %224 = icmp eq i8 %222, 46
  br i1 %224, label %225, label %227

225:                                              ; preds = %223, %215
  %226 = phi i8 [ 46, %223 ], [ %222, %215 ]
  store i8 0, i8* %201, align 16, !tbaa !3
  br label %227

227:                                              ; preds = %225, %223
  %228 = phi i8 [ %226, %225 ], [ %222, %223 ]
  %229 = icmp eq i8 %228, 46
  %230 = select i1 %229, i64 %220, i64 %206
  %231 = icmp eq i64 %230, 0
  br i1 %231, label %304, label %232

232:                                              ; preds = %227
  %233 = add i64 %230, -1
  %234 = getelementptr inbounds i8, i8* %2, i64 %233
  %235 = load i8, i8* %234, align 1, !tbaa !3
  %236 = icmp eq i8 %235, 46
  %237 = icmp ugt i64 %230, 255
  %238 = select i1 %236, i1 true, i1 %237
  br i1 %238, label %304, label %239

239:                                              ; preds = %232
  %240 = call i8* @memcpy(i8* noundef nonnull %1, i8* noundef nonnull %2, i64 noundef %230) #7
  %241 = getelementptr inbounds i8, i8* %1, i64 %230
  store i8 46, i8* %241, align 1, !tbaa !3
  %242 = load i8, i8* %201, align 16, !tbaa !3
  %243 = icmp eq i8 %242, 0
  br i1 %243, label %302, label %244

244:                                              ; preds = %239
  %245 = sub nuw nsw i64 255, %230
  %246 = getelementptr inbounds i8, i8* %241, i64 1
  %247 = add nuw nsw i64 %230, 1
  br label %248

248:                                              ; preds = %299, %244
  %249 = phi i8 [ %242, %244 ], [ %300, %299 ]
  %250 = phi i8* [ %201, %244 ], [ %284, %299 ]
  %251 = sext i8 %249 to i32
  %252 = icmp ne i8 %249, 32
  %253 = add nsw i32 %251, -14
  %254 = icmp ult i32 %253, -5
  %255 = and i1 %252, %254
  br i1 %255, label %267, label %256

256:                                              ; preds = %248, %256
  %257 = phi i8* [ %258, %256 ], [ %250, %248 ]
  %258 = getelementptr inbounds i8, i8* %257, i64 1
  %259 = load i8, i8* %258, align 1, !tbaa !3
  %260 = sext i8 %259 to i32
  %261 = icmp ne i8 %259, 32
  %262 = add nsw i32 %260, -14
  %263 = icmp ult i32 %262, -5
  %264 = and i1 %261, %263
  br i1 %264, label %265, label %256

265:                                              ; preds = %256
  %266 = icmp eq i8 %259, 0
  br i1 %266, label %302, label %267

267:                                              ; preds = %248, %265
  %268 = phi i8* [ %258, %265 ], [ %250, %248 ]
  %269 = phi i8 [ %259, %265 ], [ %249, %248 ]
  br label %270

270:                                              ; preds = %267, %278
  %271 = phi i8 [ %280, %278 ], [ %269, %267 ]
  %272 = phi i8* [ %279, %278 ], [ %268, %267 ]
  %273 = sext i8 %271 to i32
  %274 = icmp ne i8 %271, 32
  %275 = add nsw i32 %273, -14
  %276 = icmp ult i32 %275, -5
  %277 = and i1 %274, %276
  br i1 %277, label %278, label %282

278:                                              ; preds = %270
  %279 = getelementptr inbounds i8, i8* %272, i64 1
  %280 = load i8, i8* %279, align 1, !tbaa !3
  %281 = icmp eq i8 %280, 0
  br i1 %281, label %282, label %270

282:                                              ; preds = %278, %270
  %283 = phi i8 [ %271, %270 ], [ 0, %278 ]
  %284 = phi i8* [ %272, %270 ], [ %279, %278 ]
  %285 = icmp eq i8* %284, %268
  br i1 %285, label %302, label %286

286:                                              ; preds = %282
  %287 = ptrtoint i8* %284 to i64
  %288 = ptrtoint i8* %268 to i64
  %289 = sub i64 %287, %288
  %290 = icmp ult i64 %289, %245
  br i1 %290, label %291, label %299

291:                                              ; preds = %286
  %292 = call i8* @memcpy(i8* noundef nonnull %246, i8* noundef nonnull %268, i64 noundef %289) #7
  %293 = add i64 %247, %289
  %294 = getelementptr inbounds i8, i8* %1, i64 %293
  store i8 0, i8* %294, align 1, !tbaa !3
  %295 = call fastcc i32 @name_from_dns(%struct.address* noundef nonnull %0, i8* noundef nonnull %1, i8* noundef nonnull %1, i32 noundef %33, %struct.resolvconf* noundef nonnull %7) #7
  %296 = icmp eq i32 %295, 0
  br i1 %296, label %297, label %304

297:                                              ; preds = %291
  %298 = load i8, i8* %284, align 1, !tbaa !3
  br label %299

299:                                              ; preds = %297, %286
  %300 = phi i8 [ %298, %297 ], [ %283, %286 ]
  %301 = icmp eq i8 %300, 0
  br i1 %301, label %302, label %248

302:                                              ; preds = %299, %282, %265, %239
  store i8 0, i8* %241, align 1, !tbaa !3
  %303 = call fastcc i32 @name_from_dns(%struct.address* noundef nonnull %0, i8* noundef nonnull %1, i8* noundef nonnull %2, i32 noundef %33, %struct.resolvconf* noundef nonnull %7) #7
  br label %304

304:                                              ; preds = %291, %200, %227, %232, %302
  %305 = phi i32 [ %303, %302 ], [ -1, %200 ], [ -2, %232 ], [ -2, %227 ], [ %295, %291 ]
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %202) #9
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %201) #9
  br label %306

306:                                              ; preds = %195, %198, %304, %70
  %307 = phi i32 [ %71, %70 ], [ %186, %198 ], [ %305, %304 ], [ %196, %195 ]
  %308 = icmp slt i32 %307, 1
  br i1 %308, label %309, label %312

309:                                              ; preds = %306
  %310 = icmp eq i32 %307, 0
  br i1 %310, label %311, label %510

311:                                              ; preds = %73, %309
  br label %510

312:                                              ; preds = %52, %61, %39, %44, %306
  %313 = phi i32 [ %307, %306 ], [ 1, %52 ], [ %63, %61 ], [ 1, %39 ], [ %46, %44 ]
  %314 = and i32 %32, 8
  %315 = icmp eq i32 %314, 0
  br i1 %315, label %368, label %316

316:                                              ; preds = %312
  %317 = and i32 %32, 16
  %318 = icmp eq i32 %317, 0
  br i1 %318, label %319, label %352

319:                                              ; preds = %316
  %320 = zext i32 %313 to i64
  br label %321

321:                                              ; preds = %319, %329
  %322 = phi i64 [ 0, %319 ], [ %330, %329 ]
  %323 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %322, i32 0
  %324 = load i32, i32* %323, align 4, !tbaa !17
  %325 = icmp eq i32 %324, 10
  br i1 %325, label %326, label %329

326:                                              ; preds = %321
  %327 = trunc i64 %322 to i32
  %328 = icmp sgt i32 %313, %327
  br i1 %328, label %332, label %510

329:                                              ; preds = %321
  %330 = add nuw nsw i64 %322, 1
  %331 = icmp eq i64 %330, %320
  br i1 %331, label %349, label %321

332:                                              ; preds = %326, %345
  %333 = phi i64 [ %347, %345 ], [ %322, %326 ]
  %334 = phi i32 [ %346, %345 ], [ 0, %326 ]
  %335 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %333
  %336 = getelementptr inbounds %struct.address, %struct.address* %335, i64 0, i32 0
  %337 = load i32, i32* %336, align 4, !tbaa !17
  %338 = icmp eq i32 %337, 10
  br i1 %338, label %339, label %345

339:                                              ; preds = %332
  %340 = add nsw i32 %334, 1
  %341 = sext i32 %334 to i64
  %342 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %341
  %343 = bitcast %struct.address* %342 to i8*
  %344 = bitcast %struct.address* %335 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(28) %343, i8* noundef nonnull align 4 dereferenceable(28) %344, i64 28, i1 false) #11, !tbaa.struct !6
  br label %345

345:                                              ; preds = %332, %339
  %346 = phi i32 [ %340, %339 ], [ %334, %332 ]
  %347 = add nuw nsw i64 %333, 1
  %348 = icmp eq i64 %347, %320
  br i1 %348, label %349, label %332

349:                                              ; preds = %329, %345
  %350 = phi i32 [ %346, %345 ], [ %313, %329 ]
  %351 = icmp sgt i32 %350, 0
  br i1 %351, label %352, label %510

352:                                              ; preds = %316, %349
  %353 = phi i32 [ %350, %349 ], [ %313, %316 ]
  %354 = zext i32 %353 to i64
  br label %355

355:                                              ; preds = %352, %365
  %356 = phi i64 [ 0, %352 ], [ %366, %365 ]
  %357 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %356, i32 0
  %358 = load i32, i32* %357, align 4, !tbaa !17
  %359 = icmp eq i32 %358, 2
  br i1 %359, label %360, label %365

360:                                              ; preds = %355
  %361 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %356, i32 2, i64 0
  %362 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %356, i32 2, i64 12
  %363 = call i8* @memcpy(i8* noundef nonnull %362, i8* noundef nonnull %361, i64 noundef 4) #7
  %364 = call i8* @memcpy(i8* noundef nonnull %361, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 noundef 12) #7
  store i32 10, i32* %357, align 4, !tbaa !17
  br label %365

365:                                              ; preds = %355, %360
  %366 = add nuw nsw i64 %356, 1
  %367 = icmp eq i64 %366, %354
  br i1 %367, label %368, label %355

368:                                              ; preds = %365, %312
  %369 = phi i32 [ %313, %312 ], [ %353, %365 ]
  %370 = icmp slt i32 %369, 2
  %371 = icmp eq i32 %33, 2
  %372 = or i1 %371, %370
  br i1 %372, label %510, label %373

373:                                              ; preds = %368
  %374 = zext i32 %369 to i64
  br label %375

375:                                              ; preds = %373, %380
  %376 = phi i64 [ 0, %373 ], [ %381, %380 ]
  %377 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %376, i32 0
  %378 = load i32, i32* %377, align 4, !tbaa !17
  %379 = icmp eq i32 %378, 2
  br i1 %379, label %380, label %383

380:                                              ; preds = %375
  %381 = add nuw nsw i64 %376, 1
  %382 = icmp eq i64 %381, %374
  br i1 %382, label %510, label %375

383:                                              ; preds = %375
  %384 = trunc i64 %376 to i32
  %385 = icmp eq i32 %369, %384
  br i1 %385, label %510, label %386

386:                                              ; preds = %383
  %387 = bitcast i32* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %387) #9
  %388 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %11) #7
  %389 = icmp sgt i32 %369, 0
  br i1 %389, label %390, label %505

390:                                              ; preds = %386
  %391 = bitcast %struct.sockaddr_in6* %12 to i8*
  %392 = bitcast %struct.sockaddr_in6* %13 to i8*
  %393 = getelementptr inbounds %struct.sockaddr_in6, %struct.sockaddr_in6* %13, i64 0, i32 0
  %394 = getelementptr inbounds %struct.sockaddr_in6, %struct.sockaddr_in6* %13, i64 0, i32 1
  %395 = getelementptr inbounds %struct.sockaddr_in6, %struct.sockaddr_in6* %13, i64 0, i32 2
  %396 = getelementptr inbounds %struct.sockaddr_in6, %struct.sockaddr_in6* %13, i64 0, i32 3
  %397 = bitcast %struct.in6_addr* %396 to i8*
  %398 = getelementptr inbounds %struct.sockaddr_in6, %struct.sockaddr_in6* %13, i64 0, i32 4
  %399 = bitcast %struct.sockaddr_in* %14 to i8*
  %400 = bitcast %struct.sockaddr_in* %15 to i8*
  %401 = bitcast i32* %16 to i8*
  %402 = getelementptr inbounds %struct.sockaddr_in6, %struct.sockaddr_in6* %12, i64 0, i32 3, i32 0
  %403 = bitcast %union.anon* %402 to i8*
  %404 = getelementptr inbounds %struct.sockaddr_in6, %struct.sockaddr_in6* %13, i64 0, i32 3, i32 0, i32 0, i64 3
  %405 = bitcast i32* %404 to i8*
  %406 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %15, i64 0, i32 2
  %407 = bitcast %struct.in_addr* %406 to i8*
  %408 = getelementptr inbounds %struct.sockaddr_in6, %struct.sockaddr_in6* %12, i64 0, i32 3, i32 0, i32 0, i64 3
  %409 = bitcast i32* %408 to i8*
  %410 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %14, i64 0, i32 2
  %411 = bitcast %struct.in_addr* %410 to i8*
  %412 = getelementptr inbounds %struct.sockaddr_in6, %struct.sockaddr_in6* %12, i64 0, i32 3
  %413 = bitcast %struct.in6_addr* %412 to [16 x i8]*
  %414 = bitcast %struct.in6_addr* %396 to [16 x i8]*
  %415 = zext i32 %369 to i64
  br label %416

416:                                              ; preds = %390, %489
  %417 = phi i64 [ 0, %390 ], [ %503, %489 ]
  %418 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %417, i32 0
  %419 = load i32, i32* %418, align 4, !tbaa !17
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %391) #9
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(28) %391, i8 0, i64 28, i1 false) #11
  call void @llvm.lifetime.start.p0i8(i64 28, i8* nonnull %392) #9
  store i16 10, i16* %393, align 4, !tbaa !19
  store i16 -1, i16* %394, align 2, !tbaa !23
  store i32 0, i32* %395, align 4, !tbaa !24
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %397, i8 0, i64 16, i1 false) #11
  %420 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %417, i32 1
  %421 = load i32, i32* %420, align 4, !tbaa !25
  store i32 %421, i32* %398, align 4, !tbaa !26
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %399) #9
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %399, i8 0, i64 16, i1 false) #11
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %400) #9
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %400, i8* noundef nonnull align 4 dereferenceable(16) bitcast (%struct.sockaddr_in* @__const.__lookup_name.da4 to i8*), i64 16, i1 false) #11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %401) #9
  %422 = icmp eq i32 %419, 10
  br i1 %422, label %423, label %426

423:                                              ; preds = %416
  %424 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %417, i32 2, i64 0
  %425 = call i8* @memcpy(i8* noundef nonnull %397, i8* noundef nonnull %424, i64 noundef 16) #7
  br label %433

426:                                              ; preds = %416
  %427 = call i8* @memcpy(i8* noundef nonnull %403, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 noundef 12) #7
  %428 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %417, i32 2, i64 0
  %429 = call i8* @memcpy(i8* noundef nonnull %405, i8* noundef nonnull %428, i64 noundef 4) #7
  %430 = call i8* @memcpy(i8* noundef nonnull %397, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 noundef 12) #7
  %431 = call i8* @memcpy(i8* noundef nonnull %405, i8* noundef nonnull %428, i64 noundef 4) #7
  %432 = call i8* @memcpy(i8* noundef nonnull %407, i8* noundef nonnull %428, i64 noundef 4) #7
  br label %433

433:                                              ; preds = %426, %423
  %434 = phi i32 [ 16, %426 ], [ 28, %423 ]
  %435 = phi i8* [ %399, %426 ], [ %391, %423 ]
  %436 = phi i8* [ %400, %426 ], [ %392, %423 ]
  store i32 %434, i32* %16, align 4, !tbaa !7
  %437 = call fastcc %struct.policy* @policyof(%struct.in6_addr* noundef nonnull %396) #12
  %438 = call fastcc i32 @scopeof(%struct.in6_addr* noundef nonnull %396) #12
  %439 = getelementptr inbounds %struct.policy, %struct.policy* %437, i64 0, i32 4
  %440 = load i8, i8* %439, align 1, !tbaa !27
  %441 = getelementptr inbounds %struct.policy, %struct.policy* %437, i64 0, i32 3
  %442 = load i8, i8* %441, align 1, !tbaa !29
  %443 = zext i8 %442 to i32
  %444 = call i32 @socket(i32 noundef %419, i32 noundef 524290, i32 noundef 17) #7
  %445 = icmp sgt i32 %444, -1
  br i1 %445, label %446, label %489

446:                                              ; preds = %433
  %447 = bitcast i8* %436 to %struct.sockaddr*
  %448 = call i32 @connect(i32 noundef %444, %struct.sockaddr* noundef %447, i32 noundef %434) #7
  %449 = icmp eq i32 %448, 0
  br i1 %449, label %450, label %485

450:                                              ; preds = %446
  %451 = bitcast i8* %435 to %struct.sockaddr*
  %452 = call i32 @getsockname(i32 noundef %444, %struct.sockaddr* noundef %451, i32* noundef nonnull %16) #7
  %453 = icmp eq i32 %452, 0
  br i1 %453, label %454, label %485

454:                                              ; preds = %450
  %455 = icmp eq i32 %419, 2
  br i1 %455, label %456, label %458

456:                                              ; preds = %454
  %457 = call i8* @memcpy(i8* noundef nonnull %409, i8* noundef nonnull %411, i64 noundef 4) #7
  br label %458

458:                                              ; preds = %456, %454
  %459 = call fastcc i32 @scopeof(%struct.in6_addr* noundef nonnull %412) #12
  %460 = icmp eq i32 %438, %459
  %461 = select i1 %460, i32 1610612736, i32 1073741824
  %462 = call fastcc %struct.policy* @policyof(%struct.in6_addr* noundef nonnull %412) #7
  %463 = getelementptr inbounds %struct.policy, %struct.policy* %462, i64 0, i32 4
  %464 = load i8, i8* %463, align 1, !tbaa !27
  %465 = icmp eq i8 %464, %440
  %466 = or i32 %461, 268435456
  %467 = select i1 %465, i32 %466, i32 %461
  br label %468

468:                                              ; preds = %482, %458
  %469 = phi i32 [ 0, %458 ], [ %483, %482 ]
  %470 = lshr i32 %469, 3
  %471 = zext i32 %470 to i64
  %472 = getelementptr inbounds [16 x i8], [16 x i8]* %413, i64 0, i64 %471
  %473 = load i8, i8* %472, align 1, !tbaa !3
  %474 = getelementptr inbounds [16 x i8], [16 x i8]* %414, i64 0, i64 %471
  %475 = load i8, i8* %474, align 1, !tbaa !3
  %476 = xor i8 %475, %473
  %477 = zext i8 %476 to i32
  %478 = and i32 %469, 7
  %479 = lshr i32 128, %478
  %480 = and i32 %479, %477
  %481 = icmp eq i32 %480, 0
  br i1 %481, label %482, label %485

482:                                              ; preds = %468
  %483 = add nuw nsw i32 %469, 1
  %484 = icmp eq i32 %483, 128
  br i1 %484, label %485, label %468

485:                                              ; preds = %482, %468, %450, %446
  %486 = phi i32 [ 0, %446 ], [ 1073741824, %450 ], [ %467, %468 ], [ %467, %482 ]
  %487 = phi i32 [ 0, %446 ], [ 0, %450 ], [ 128, %482 ], [ %469, %468 ]
  %488 = call i32 @close(i32 noundef %444) #7
  br label %489

489:                                              ; preds = %485, %433
  %490 = phi i32 [ %486, %485 ], [ 0, %433 ]
  %491 = phi i32 [ %487, %485 ], [ 0, %433 ]
  %492 = shl nuw nsw i32 %443, 20
  %493 = mul i32 %438, -65536
  %494 = add i32 %493, 983040
  %495 = shl i32 %491, 8
  %496 = trunc i64 %417 to i32
  %497 = sub i32 48, %496
  %498 = or i32 %494, %497
  %499 = or i32 %498, %492
  %500 = or i32 %499, %490
  %501 = or i32 %500, %495
  %502 = getelementptr inbounds %struct.address, %struct.address* %0, i64 %417, i32 3
  store i32 %501, i32* %502, align 4, !tbaa !30
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %401) #9
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %400) #9
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %399) #9
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %392) #9
  call void @llvm.lifetime.end.p0i8(i64 28, i8* nonnull %391) #9
  %503 = add nuw nsw i64 %417, 1
  %504 = icmp eq i64 %503, %415
  br i1 %504, label %505, label %416

505:                                              ; preds = %489, %386
  %506 = bitcast %struct.address* %0 to i8*
  %507 = sext i32 %369 to i64
  call void @qsort(i8* noundef nonnull %506, i64 noundef %507, i64 noundef 28, i32 (i8*, i8*)* noundef nonnull @addrcmp) #7
  %508 = load i32, i32* %11, align 4, !tbaa !7
  %509 = call i32 @pthread_setcancelstate(i32 noundef %508, i32* noundef null) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %387) #9
  br label %510

510:                                              ; preds = %380, %326, %349, %311, %309, %18, %383, %368, %505
  %511 = phi i32 [ %369, %505 ], [ %369, %368 ], [ %369, %383 ], [ -2, %18 ], [ -2, %311 ], [ %307, %309 ], [ %350, %349 ], [ 0, %326 ], [ %369, %380 ]
  ret i32 %511
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind optsize strictfp
define internal fastcc nonnull %struct.policy* @policyof(%struct.in6_addr* noundef %0) unnamed_addr #0 {
  %2 = bitcast %struct.in6_addr* %0 to [16 x i8]*
  %3 = bitcast %struct.in6_addr* %0 to i8*
  br label %4

4:                                                ; preds = %24, %1
  %5 = phi i64 [ %25, %24 ], [ 0, %1 ]
  %6 = getelementptr inbounds [6 x %struct.policy], [6 x %struct.policy]* @defpolicy, i64 0, i64 %5, i32 0, i64 0
  %7 = getelementptr inbounds [6 x %struct.policy], [6 x %struct.policy]* @defpolicy, i64 0, i64 %5, i32 1
  %8 = load i8, i8* %7, align 4, !tbaa !31
  %9 = zext i8 %8 to i64
  %10 = tail call i32 @memcmp(i8* noundef %3, i8* noundef nonnull %6, i64 noundef %9) #7
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %24

12:                                               ; preds = %4
  %13 = getelementptr inbounds [16 x i8], [16 x i8]* %2, i64 0, i64 %9
  %14 = load i8, i8* %13, align 1, !tbaa !3
  %15 = getelementptr inbounds [6 x %struct.policy], [6 x %struct.policy]* @defpolicy, i64 0, i64 %5, i32 2
  %16 = load i8, i8* %15, align 1, !tbaa !32
  %17 = and i8 %16, %14
  %18 = getelementptr inbounds [6 x %struct.policy], [6 x %struct.policy]* @defpolicy, i64 0, i64 %5, i32 0, i64 %9
  %19 = load i8, i8* %18, align 1, !tbaa !3
  %20 = icmp eq i8 %17, %19
  br i1 %20, label %21, label %24

21:                                               ; preds = %12
  %22 = and i64 %5, 4294967295
  %23 = getelementptr inbounds [6 x %struct.policy], [6 x %struct.policy]* @defpolicy, i64 0, i64 %22
  ret %struct.policy* %23

24:                                               ; preds = %12, %4
  %25 = add nuw i64 %5, 1
  br label %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define internal fastcc i32 @scopeof(%struct.in6_addr* nocapture noundef readonly %0) unnamed_addr #5 {
  %2 = bitcast %struct.in6_addr* %0 to i8*
  %3 = load i8, i8* %2, align 1, !tbaa !3
  switch i8 %3, label %15 [
    i8 -1, label %4
    i8 -2, label %10
  ]

4:                                                ; preds = %1
  %5 = bitcast %struct.in6_addr* %0 to [16 x i8]*
  %6 = getelementptr inbounds [16 x i8], [16 x i8]* %5, i64 0, i64 1
  %7 = load i8, i8* %6, align 1, !tbaa !3
  %8 = and i8 %7, 15
  %9 = zext i8 %8 to i32
  br label %50

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %2, i64 1
  %12 = load i8, i8* %11, align 1, !tbaa !3
  %13 = and i8 %12, -64
  %14 = icmp eq i8 %13, -128
  br i1 %14, label %50, label %15

15:                                               ; preds = %1, %10
  %16 = getelementptr %struct.in6_addr, %struct.in6_addr* %0, i64 0, i32 0, i32 0, i64 0
  %17 = load i32, i32* %16, align 4, !tbaa !7
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %44

19:                                               ; preds = %15
  %20 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %0, i64 0, i32 0, i32 0, i64 1
  %21 = load i32, i32* %20, align 4, !tbaa !7
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %44

23:                                               ; preds = %19
  %24 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %0, i64 0, i32 0, i32 0, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !7
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %44

27:                                               ; preds = %23
  %28 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %0, i64 0, i32 0, i32 0, i64 3
  %29 = bitcast i32* %28 to i8*
  %30 = load i8, i8* %29, align 1, !tbaa !3
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %32, label %44

32:                                               ; preds = %27
  %33 = getelementptr inbounds i8, i8* %2, i64 13
  %34 = load i8, i8* %33, align 1, !tbaa !3
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %36, label %44

36:                                               ; preds = %32
  %37 = getelementptr inbounds i8, i8* %2, i64 14
  %38 = load i8, i8* %37, align 1, !tbaa !3
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %40, label %44

40:                                               ; preds = %36
  %41 = getelementptr inbounds i8, i8* %2, i64 15
  %42 = load i8, i8* %41, align 1, !tbaa !3
  %43 = icmp eq i8 %42, 1
  br i1 %43, label %50, label %44

44:                                               ; preds = %40, %36, %32, %27, %23, %19, %15
  %45 = icmp eq i8 %3, -2
  %46 = and i32 %17, 49152
  %47 = icmp eq i32 %46, 49152
  %48 = select i1 %45, i1 %47, i1 false
  %49 = select i1 %48, i32 5, i32 14
  br label %50

50:                                               ; preds = %44, %40, %10, %4
  %51 = phi i32 [ %9, %4 ], [ 2, %10 ], [ 2, %40 ], [ %49, %44 ]
  ret i32 %51
}

; Function Attrs: optsize
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @connect(i32 noundef, %struct.sockaddr* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @getsockname(i32 noundef, %struct.sockaddr* noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare void @qsort(i8* noundef, i64 noundef, i64 noundef, i32 (i8*, i8*)* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define internal i32 @addrcmp(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) #5 {
  %3 = getelementptr inbounds i8, i8* %1, i64 24
  %4 = bitcast i8* %3 to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !30
  %6 = getelementptr inbounds i8, i8* %0, i64 24
  %7 = bitcast i8* %6 to i32*
  %8 = load i32, i32* %7, align 4, !tbaa !30
  %9 = sub nsw i32 %5, %8
  ret i32 %9
}

; Function Attrs: optsize
declare hidden i32 @__lookup_ipliteral(%struct.address* noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__fopen_rb_ca(i8* noundef, %struct._IO_FILE* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #6

; Function Attrs: optsize
declare i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strstr(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @is_valid_hostname(i8* noundef %0) unnamed_addr #0 {
  %2 = tail call i64 @strnlen(i8* noundef %0, i64 noundef 255) #7
  %3 = add i64 %2, -255
  %4 = icmp ult i64 %3, -254
  br i1 %4, label %26, label %5

5:                                                ; preds = %1
  %6 = tail call i64 @mbstowcs(i32* noundef null, i8* noundef %0, i64 noundef 0) #7
  %7 = icmp eq i64 %6, -1
  br i1 %7, label %26, label %8

8:                                                ; preds = %5, %20
  %9 = phi i8* [ %21, %20 ], [ %0, %5 ]
  %10 = load i8, i8* %9, align 1, !tbaa !3
  %11 = freeze i8 %10
  %12 = icmp slt i8 %11, 0
  %13 = add i8 %11, -45
  %14 = icmp ult i8 %13, 2
  %15 = or i1 %12, %14
  br i1 %15, label %20, label %16

16:                                               ; preds = %8
  %17 = zext i8 %11 to i32
  %18 = tail call i32 @isalnum(i32 noundef %17) #7
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %22, label %20

20:                                               ; preds = %8, %16
  %21 = getelementptr inbounds i8, i8* %9, i64 1
  br label %8

22:                                               ; preds = %16
  %23 = load i8, i8* %9, align 1, !tbaa !3
  %24 = icmp eq i8 %23, 0
  %25 = zext i1 %24 to i32
  br label %26

26:                                               ; preds = %1, %5, %22
  %27 = phi i32 [ %25, %22 ], [ 0, %5 ], [ 0, %1 ]
  ret i32 %27
}

; Function Attrs: optsize
declare hidden i32 @__fclose_ca(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @mbstowcs(i32* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @isalnum(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__get_resolv_conf(%struct.resolvconf* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @name_from_dns(%struct.address* noundef align 4 dereferenceable(1344) %0, i8* noundef align 1 dereferenceable(256) %1, i8* noundef %2, i32 noundef %3, %struct.resolvconf* noundef %4) unnamed_addr #0 {
  %6 = alloca [2 x [280 x i8]], align 16
  %7 = alloca [2 x [512 x i8]], align 16
  %8 = alloca [2 x i8*], align 16
  %9 = alloca [2 x i8*], align 16
  %10 = alloca [2 x i32], align 4
  %11 = alloca [2 x i32], align 4
  %12 = alloca %struct.dpc_ctx, align 8
  %13 = getelementptr inbounds [2 x [280 x i8]], [2 x [280 x i8]]* %6, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 560, i8* nonnull %13) #9
  %14 = getelementptr inbounds [2 x [512 x i8]], [2 x [512 x i8]]* %7, i64 0, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %14) #9
  %15 = bitcast [2 x i8*]* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %15) #9
  %16 = getelementptr inbounds [2 x i8*], [2 x i8*]* %8, i64 0, i64 0
  store i8* %13, i8** %16, align 16, !tbaa !33
  %17 = getelementptr inbounds [2 x i8*], [2 x i8*]* %8, i64 0, i64 1
  %18 = getelementptr inbounds [2 x [280 x i8]], [2 x [280 x i8]]* %6, i64 0, i64 1, i64 0
  store i8* %18, i8** %17, align 8, !tbaa !33
  %19 = bitcast [2 x i8*]* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %19) #9
  %20 = getelementptr inbounds [2 x i8*], [2 x i8*]* %9, i64 0, i64 0
  store i8* %14, i8** %20, align 16, !tbaa !33
  %21 = getelementptr inbounds [2 x i8*], [2 x i8*]* %9, i64 0, i64 1
  %22 = getelementptr inbounds [2 x [512 x i8]], [2 x [512 x i8]]* %7, i64 0, i64 1, i64 0
  store i8* %22, i8** %21, align 8, !tbaa !33
  %23 = bitcast [2 x i32]* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %23) #9
  %24 = bitcast [2 x i32]* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %24) #9
  %25 = bitcast %struct.dpc_ctx* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %25) #9
  %26 = getelementptr inbounds %struct.dpc_ctx, %struct.dpc_ctx* %12, i64 0, i32 0
  store %struct.address* %0, %struct.address** %26, align 8, !tbaa !35
  %27 = getelementptr inbounds %struct.dpc_ctx, %struct.dpc_ctx* %12, i64 0, i32 1
  store i8* %1, i8** %27, align 8, !tbaa !37
  %28 = getelementptr inbounds %struct.dpc_ctx, %struct.dpc_ctx* %12, i64 0, i32 2
  store i32 0, i32* %28, align 8, !tbaa !38
  br label %29

29:                                               ; preds = %5, %47
  %30 = phi i1 [ true, %5 ], [ false, %47 ]
  %31 = phi i64 [ 0, %5 ], [ 1, %47 ]
  %32 = phi i32 [ 0, %5 ], [ %48, %47 ]
  %33 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* @name_from_dns.afrr, i64 0, i64 %31, i32 0
  %34 = load i32, i32* %33, align 8, !tbaa !39
  %35 = icmp eq i32 %34, %3
  br i1 %35, label %47, label %36

36:                                               ; preds = %29
  %37 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* @name_from_dns.afrr, i64 0, i64 %31, i32 1
  %38 = load i32, i32* %37, align 4, !tbaa !41
  %39 = sext i32 %32 to i64
  %40 = getelementptr inbounds [2 x [280 x i8]], [2 x [280 x i8]]* %6, i64 0, i64 %39, i64 0
  %41 = call i32 @__res_mkquery(i32 noundef 0, i8* noundef %2, i32 noundef 1, i32 noundef %38, i8* noundef null, i32 noundef 0, i8* noundef null, i8* noundef nonnull %40, i32 noundef 280) #7
  %42 = getelementptr inbounds [2 x i32], [2 x i32]* %10, i64 0, i64 %39
  store i32 %41, i32* %42, align 4, !tbaa !7
  %43 = icmp eq i32 %41, -1
  br i1 %43, label %87, label %44

44:                                               ; preds = %36
  %45 = getelementptr inbounds [2 x [280 x i8]], [2 x [280 x i8]]* %6, i64 0, i64 %39, i64 3
  store i8 0, i8* %45, align 1, !tbaa !3
  %46 = add nsw i32 %32, 1
  br label %47

47:                                               ; preds = %29, %44
  %48 = phi i32 [ %46, %44 ], [ %32, %29 ]
  br i1 %30, label %29, label %49

49:                                               ; preds = %47
  %50 = getelementptr inbounds [2 x i32], [2 x i32]* %10, i64 0, i64 0
  %51 = getelementptr inbounds [2 x i32], [2 x i32]* %11, i64 0, i64 0
  %52 = call i32 @__res_msend_rc(i32 noundef %48, i8** noundef nonnull %16, i32* noundef nonnull %50, i8** noundef nonnull %20, i32* noundef nonnull %51, i32 noundef 512, %struct.resolvconf* noundef %4) #7
  %53 = icmp slt i32 %52, 0
  br i1 %53, label %87, label %54

54:                                               ; preds = %49
  %55 = icmp sgt i32 %48, 0
  br i1 %55, label %56, label %84

56:                                               ; preds = %54
  %57 = zext i32 %48 to i64
  br label %61

58:                                               ; preds = %70
  br i1 %55, label %59, label %84

59:                                               ; preds = %58
  %60 = zext i32 %48 to i64
  br label %73

61:                                               ; preds = %56, %70
  %62 = phi i64 [ 0, %56 ], [ %71, %70 ]
  %63 = getelementptr inbounds [2 x i32], [2 x i32]* %11, i64 0, i64 %62
  %64 = load i32, i32* %63, align 4, !tbaa !7
  %65 = icmp slt i32 %64, 4
  br i1 %65, label %85, label %66

66:                                               ; preds = %61
  %67 = getelementptr inbounds [2 x [512 x i8]], [2 x [512 x i8]]* %7, i64 0, i64 %62, i64 3
  %68 = load i8, i8* %67, align 1, !tbaa !3
  %69 = and i8 %68, 15
  switch i8 %69, label %87 [
    i8 2, label %85
    i8 3, label %86
    i8 0, label %70
  ]

70:                                               ; preds = %66
  %71 = add nuw nsw i64 %62, 1
  %72 = icmp eq i64 %71, %57
  br i1 %72, label %58, label %61

73:                                               ; preds = %59, %73
  %74 = phi i64 [ 0, %59 ], [ %79, %73 ]
  %75 = getelementptr inbounds [2 x [512 x i8]], [2 x [512 x i8]]* %7, i64 0, i64 %74, i64 0
  %76 = getelementptr inbounds [2 x i32], [2 x i32]* %11, i64 0, i64 %74
  %77 = load i32, i32* %76, align 4, !tbaa !7
  %78 = call i32 @__dns_parse(i8* noundef nonnull %75, i32 noundef %77, i32 (i8*, i32, i8*, i32, i8*)* noundef nonnull @dns_parse_callback, i8* noundef nonnull %25) #7
  %79 = add nuw nsw i64 %74, 1
  %80 = icmp eq i64 %79, %60
  br i1 %80, label %81, label %73

81:                                               ; preds = %73
  %82 = load i32, i32* %28, align 8, !tbaa !38
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %87

84:                                               ; preds = %54, %58, %81
  br label %87

85:                                               ; preds = %61, %66
  br label %87

86:                                               ; preds = %66
  br label %87

87:                                               ; preds = %36, %66, %86, %85, %84, %81, %49
  %88 = phi i32 [ -11, %49 ], [ -2, %84 ], [ %82, %81 ], [ -3, %85 ], [ 0, %86 ], [ -4, %66 ], [ -2, %36 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %25) #9
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %24) #9
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %23) #9
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %19) #9
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %15) #9
  call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %14) #9
  call void @llvm.lifetime.end.p0i8(i64 560, i8* nonnull %13) #9
  ret i32 %88
}

; Function Attrs: optsize
declare hidden i32 @__res_mkquery(i32 noundef, i8* noundef, i32 noundef, i32 noundef, i8* noundef, i32 noundef, i8* noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__res_msend_rc(i32 noundef, i8** noundef, i32* noundef, i8** noundef, i32* noundef, i32 noundef, %struct.resolvconf* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__dns_parse(i8* noundef, i32 noundef, i32 (i8*, i32, i8*, i32, i8*)* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal i32 @dns_parse_callback(i8* nocapture noundef %0, i32 noundef %1, i8* noundef %2, i32 noundef %3, i8* noundef %4) #0 {
  %6 = alloca [256 x i8], align 16
  %7 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %7) #9
  %8 = getelementptr inbounds i8, i8* %0, i64 16
  %9 = bitcast i8* %8 to i32*
  %10 = load i32, i32* %9, align 8, !tbaa !38
  %11 = icmp sgt i32 %10, 47
  br i1 %11, label %47, label %12

12:                                               ; preds = %5
  switch i32 %1, label %47 [
    i32 1, label %13
    i32 28, label %24
    i32 5, label %35
  ]

13:                                               ; preds = %12
  %14 = icmp eq i32 %3, 4
  br i1 %14, label %15, label %47

15:                                               ; preds = %13
  %16 = bitcast i8* %0 to %struct.address**
  %17 = load %struct.address*, %struct.address** %16, align 8, !tbaa !35
  %18 = sext i32 %10 to i64
  %19 = getelementptr inbounds %struct.address, %struct.address* %17, i64 %18, i32 0
  store i32 2, i32* %19, align 4, !tbaa !17
  %20 = getelementptr inbounds %struct.address, %struct.address* %17, i64 %18, i32 1
  store i32 0, i32* %20, align 4, !tbaa !25
  %21 = add nsw i32 %10, 1
  store i32 %21, i32* %9, align 8, !tbaa !38
  %22 = getelementptr inbounds %struct.address, %struct.address* %17, i64 %18, i32 2, i64 0
  %23 = tail call i8* @memcpy(i8* noundef nonnull %22, i8* noundef %2, i64 noundef 4) #7
  br label %47

24:                                               ; preds = %12
  %25 = icmp eq i32 %3, 16
  br i1 %25, label %26, label %47

26:                                               ; preds = %24
  %27 = bitcast i8* %0 to %struct.address**
  %28 = load %struct.address*, %struct.address** %27, align 8, !tbaa !35
  %29 = sext i32 %10 to i64
  %30 = getelementptr inbounds %struct.address, %struct.address* %28, i64 %29, i32 0
  store i32 10, i32* %30, align 4, !tbaa !17
  %31 = getelementptr inbounds %struct.address, %struct.address* %28, i64 %29, i32 1
  store i32 0, i32* %31, align 4, !tbaa !25
  %32 = add nsw i32 %10, 1
  store i32 %32, i32* %9, align 8, !tbaa !38
  %33 = getelementptr inbounds %struct.address, %struct.address* %28, i64 %29, i32 2, i64 0
  %34 = tail call i8* @memcpy(i8* noundef nonnull %33, i8* noundef %2, i64 noundef 16) #7
  br label %47

35:                                               ; preds = %12
  %36 = getelementptr inbounds i8, i8* %4, i64 512
  %37 = call i32 @__dn_expand(i8* noundef %4, i8* noundef nonnull %36, i8* noundef %2, i8* noundef nonnull %7, i32 noundef 256) #7
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %39, label %47

39:                                               ; preds = %35
  %40 = call fastcc i32 @is_valid_hostname(i8* noundef nonnull %7) #12
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %47, label %42

42:                                               ; preds = %39
  %43 = getelementptr inbounds i8, i8* %0, i64 8
  %44 = bitcast i8* %43 to i8**
  %45 = load i8*, i8** %44, align 8, !tbaa !37
  %46 = call i8* @strcpy(i8* noundef %45, i8* noundef nonnull %7) #7
  br label %47

47:                                               ; preds = %15, %26, %12, %42, %39, %35, %24, %13, %5
  %48 = phi i32 [ -1, %5 ], [ -1, %13 ], [ -1, %24 ], [ 0, %35 ], [ 0, %39 ], [ 0, %42 ], [ 0, %12 ], [ 0, %26 ], [ 0, %15 ]
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %7) #9
  ret i32 %48
}

; Function Attrs: optsize
declare hidden i32 @__dn_expand(i8* noundef, i8* noundef, i8* noundef, i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @strcpy(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @memcmp(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #8 = { nounwind }
attributes #9 = { nounwind strictfp }
attributes #10 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #11 = { strictfp }
attributes #12 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 0, i64 4, !7, i64 4, i64 4, !7, i64 8, i64 16, !3, i64 24, i64 4, !7}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !4, i64 0}
!9 = !{i64 0, i64 4, !7, i64 4, i64 16, !3, i64 20, i64 4, !7}
!10 = !{i64 0, i64 16, !3, i64 16, i64 4, !7}
!11 = !{i64 0, i64 15, !3, i64 15, i64 4, !7}
!12 = !{i64 0, i64 13, !3, i64 13, i64 4, !7}
!13 = !{i64 0, i64 1, !3, i64 1, i64 4, !7}
!14 = !{i64 0, i64 4, !7}
!15 = !{!16, !8, i64 92}
!16 = !{!"resolvconf", !4, i64 0, !8, i64 84, !8, i64 88, !8, i64 92, !8, i64 96}
!17 = !{!18, !8, i64 0}
!18 = !{!"address", !8, i64 0, !8, i64 4, !4, i64 8, !8, i64 24}
!19 = !{!20, !21, i64 0}
!20 = !{!"sockaddr_in6", !21, i64 0, !21, i64 2, !8, i64 4, !22, i64 8, !8, i64 24}
!21 = !{!"short", !4, i64 0}
!22 = !{!"in6_addr", !4, i64 0}
!23 = !{!20, !21, i64 2}
!24 = !{!20, !8, i64 4}
!25 = !{!18, !8, i64 4}
!26 = !{!20, !8, i64 24}
!27 = !{!28, !4, i64 19}
!28 = !{!"policy", !4, i64 0, !4, i64 16, !4, i64 17, !4, i64 18, !4, i64 19}
!29 = !{!28, !4, i64 18}
!30 = !{!18, !8, i64 24}
!31 = !{!28, !4, i64 16}
!32 = !{!28, !4, i64 17}
!33 = !{!34, !34, i64 0}
!34 = !{!"any pointer", !4, i64 0}
!35 = !{!36, !34, i64 0}
!36 = !{!"dpc_ctx", !34, i64 0, !34, i64 8, !8, i64 16}
!37 = !{!36, !34, i64 8}
!38 = !{!36, !8, i64 16}
!39 = !{!40, !8, i64 0}
!40 = !{!"", !8, i64 0, !8, i64 4}
!41 = !{!40, !8, i64 4}
