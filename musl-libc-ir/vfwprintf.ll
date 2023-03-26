; ModuleID = 'src/stdio/vfwprintf.c'
source_filename = "src/stdio/vfwprintf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%union.arg = type { x86_fp80 }

@.str = private unnamed_addr constant [4 x i8] c"%*s\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"(null)\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"%%%s%s%s%s%s*.*%c%c\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"#\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"+\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@sizeprefix = internal unnamed_addr constant [24 x i8] c"L\00\00jLLL\00j\00\00\00\00\00jj\00\00\00\00j\00\00j", align 16
@states = internal unnamed_addr constant <{ [58 x i8], [58 x i8], [58 x i8], [58 x i8], [58 x i8], <{ [46 x i8], [12 x i8] }>, [58 x i8], [58 x i8] }> <{ [58 x i8] c"\19\00\0A\00\19\19\19\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0B\00\00\00\00\00\00\00\00\19\00\11\0A\19\19\19\03\0A\07\00\01\1B\09\0B\18\00\00\09\06\0B\00\00\0B\00\06", [58 x i8] c"\19\00\00\00\19\19\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0E\00\00\00\00\00\00\00\00\19\00\0A\0D\19\19\19\00\0D\00\00\02\00\09\0E\00\00\00\09\00\0E\00\00\0E\00\00", [58 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0C\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\00\13\00\00\00\00\09\0C\00\00\00\00\00\0C\00\00\0C\00\00", [58 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\0F\00\00\00\04\0F\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00", [58 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\11\00\00\00\00\09\12\00\00\00\00\00\12\00\00\12\00\00", <{ [46 x i8], [12 x i8] }> <{ [46 x i8] c"\1A\00\00\00\1A\1A\1A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1A\00\00\00\1A\1A\1A\00\00\00\00\00\00\09", [12 x i8] zeroinitializer }>, [58 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00\17\00\00\00\00\17\00\00\00\00\09\14\00\00\00\00\00\14\00\00\14\00\00", [58 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\15\00\00\00\00\09\16\00\00\00\00\00\16\00\00\16\00\00" }>, align 16

; Function Attrs: nounwind optsize strictfp
define i32 @vfwprintf(%struct._IO_FILE* noalias noundef %0, i32* noalias noundef %1, %struct.__va_list_tag* noundef %2) local_unnamed_addr #0 {
  %4 = alloca [1 x %struct.__va_list_tag], align 16
  %5 = alloca [9 x i32], align 16
  %6 = alloca [9 x %union.arg], align 16
  %7 = bitcast [1 x %struct.__va_list_tag]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7) #9
  %8 = bitcast [9 x i32]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 36, i8* nonnull %8) #9
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(36) %8, i8 0, i64 36, i1 false) #10
  %9 = bitcast [9 x %union.arg]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %9) #9
  %10 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_copy(i8* nonnull %7, i8* %10) #10
  %11 = getelementptr inbounds [9 x %union.arg], [9 x %union.arg]* %6, i64 0, i64 0
  %12 = getelementptr inbounds [9 x i32], [9 x i32]* %5, i64 0, i64 0
  %13 = call fastcc i32 @wprintf_core(%struct._IO_FILE* noundef null, i32* noundef %1, [1 x %struct.__va_list_tag]* noundef nonnull %4, %union.arg* noundef nonnull %11, i32* noundef nonnull %12) #11
  %14 = icmp slt i32 %13, 0
  br i1 %14, label %36, label %15

15:                                               ; preds = %3
  %16 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %17 = load volatile i32, i32* %16, align 4, !tbaa !3
  %18 = icmp sgt i32 %17, -1
  br i1 %18, label %19, label %22

19:                                               ; preds = %15
  %20 = call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #12
  %21 = icmp eq i32 %20, 0
  br label %22

22:                                               ; preds = %15, %19
  %23 = phi i1 [ %21, %19 ], [ true, %15 ]
  %24 = call i32 @fwide(%struct._IO_FILE* noundef nonnull %0, i32 noundef 1) #12
  %25 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %26 = load i32, i32* %25, align 8, !tbaa !10
  %27 = and i32 %26, 32
  %28 = and i32 %26, -33
  store i32 %28, i32* %25, align 8, !tbaa !10
  %29 = call fastcc i32 @wprintf_core(%struct._IO_FILE* noundef nonnull %0, i32* noundef %1, [1 x %struct.__va_list_tag]* noundef nonnull %4, %union.arg* noundef nonnull %11, i32* noundef nonnull %12) #11
  %30 = load i32, i32* %25, align 8, !tbaa !10
  %31 = and i32 %30, 32
  %32 = icmp eq i32 %31, 0
  %33 = select i1 %32, i32 %29, i32 -1
  %34 = or i32 %30, %27
  store i32 %34, i32* %25, align 8, !tbaa !10
  br i1 %23, label %36, label %35

35:                                               ; preds = %22
  call void @__unlockfile(%struct._IO_FILE* noundef nonnull %0) #12
  br label %36

36:                                               ; preds = %22, %35, %3
  %37 = phi i32 [ -1, %3 ], [ %33, %35 ], [ %33, %22 ]
  call void @llvm.va_end(i8* nonnull %7) #10
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %9) #9
  call void @llvm.lifetime.end.p0i8(i64 36, i8* nonnull %8) #9
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #9
  ret i32 %37
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_copy(i8*, i8*) #3

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @wprintf_core(%struct._IO_FILE* noundef %0, i32* noundef %1, [1 x %struct.__va_list_tag]* noundef %2, %union.arg* nocapture noundef %3, i32* nocapture noundef %4) unnamed_addr #0 {
  %6 = alloca %union.arg, align 16
  %7 = alloca [16 x i8], align 16
  %8 = alloca i32, align 4
  %9 = bitcast %union.arg* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %9) #9
  %10 = getelementptr inbounds [16 x i8], [16 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %10) #9
  %11 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #9
  %12 = icmp eq %struct._IO_FILE* %0, null
  %13 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %16 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %17 = bitcast %union.arg* %6 to i8**
  %18 = bitcast %union.arg* %6 to i32**
  %19 = bitcast %union.arg* %6 to i64*
  %20 = bitcast %union.arg* %6 to i64**
  %21 = bitcast %union.arg* %6 to i16**
  %22 = getelementptr inbounds %union.arg, %union.arg* %6, i64 0, i32 0
  br label %23

23:                                               ; preds = %5, %338
  %24 = phi i32 [ 0, %5 ], [ %341, %338 ]
  %25 = phi i32 [ 0, %5 ], [ %28, %338 ]
  %26 = phi i32 [ 0, %5 ], [ %340, %338 ]
  %27 = phi i32* [ %1, %5 ], [ %339, %338 ]
  %28 = add nsw i32 %24, %25
  %29 = load i32, i32* %27, align 4, !tbaa !11
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %517, label %31

31:                                               ; preds = %23, %34
  %32 = phi i32 [ %36, %34 ], [ %29, %23 ]
  %33 = phi i32* [ %35, %34 ], [ %27, %23 ]
  switch i32 %32, label %34 [
    i32 37, label %37
    i32 0, label %48
  ]

34:                                               ; preds = %31
  %35 = getelementptr inbounds i32, i32* %33, i64 1
  %36 = load i32, i32* %35, align 4, !tbaa !11
  br label %31

37:                                               ; preds = %31, %43
  %38 = phi i32* [ %44, %43 ], [ %33, %31 ]
  %39 = phi i32* [ %45, %43 ], [ %33, %31 ]
  %40 = getelementptr inbounds i32, i32* %39, i64 1
  %41 = load i32, i32* %40, align 4, !tbaa !11
  %42 = icmp eq i32 %41, 37
  br i1 %42, label %43, label %48

43:                                               ; preds = %37
  %44 = getelementptr inbounds i32, i32* %38, i64 1
  %45 = getelementptr inbounds i32, i32* %39, i64 2
  %46 = load i32, i32* %45, align 4, !tbaa !11
  %47 = icmp eq i32 %46, 37
  br i1 %47, label %37, label %48

48:                                               ; preds = %31, %37, %43
  %49 = phi i32* [ %45, %43 ], [ %39, %37 ], [ %33, %31 ]
  %50 = phi i32* [ %44, %43 ], [ %38, %37 ], [ %33, %31 ]
  %51 = ptrtoint i32* %50 to i64
  %52 = ptrtoint i32* %27 to i64
  %53 = sub i64 %51, %52
  %54 = ashr exact i64 %53, 2
  %55 = sub nsw i32 2147483647, %28
  %56 = zext i32 %55 to i64
  %57 = icmp sgt i64 %54, %56
  br i1 %57, label %542, label %58

58:                                               ; preds = %48
  %59 = trunc i64 %54 to i32
  br i1 %12, label %77, label %60

60:                                               ; preds = %58
  %61 = shl i64 %53, 30
  %62 = icmp ult i64 %61, 4294967296
  br i1 %62, label %77, label %63

63:                                               ; preds = %60
  %64 = ashr i64 %61, 32
  br label %65

65:                                               ; preds = %63, %72
  %66 = phi i64 [ %68, %72 ], [ %64, %63 ]
  %67 = phi i32* [ %73, %72 ], [ %27, %63 ]
  %68 = add i64 %66, -1
  %69 = load i32, i32* %13, align 8, !tbaa !10
  %70 = and i32 %69, 32
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %77

72:                                               ; preds = %65
  %73 = getelementptr inbounds i32, i32* %67, i64 1
  %74 = load i32, i32* %67, align 4, !tbaa !11
  %75 = call i32 @fputwc(i32 noundef %74, %struct._IO_FILE* noundef nonnull %0) #12
  %76 = icmp eq i64 %68, 0
  br i1 %76, label %77, label %65

77:                                               ; preds = %72, %65, %60, %58
  %78 = icmp eq i32 %59, 0
  br i1 %78, label %79, label %338

79:                                               ; preds = %77
  %80 = getelementptr inbounds i32, i32* %49, i64 1
  %81 = load i32, i32* %80, align 4, !tbaa !11
  %82 = add i32 %81, -48
  %83 = icmp ult i32 %82, 10
  br i1 %83, label %84, label %91

84:                                               ; preds = %79
  %85 = getelementptr inbounds i32, i32* %49, i64 2
  %86 = load i32, i32* %85, align 4, !tbaa !11
  %87 = icmp eq i32 %86, 36
  br i1 %87, label %88, label %91

88:                                               ; preds = %84
  %89 = getelementptr inbounds i32, i32* %49, i64 3
  %90 = load i32, i32* %89, align 4, !tbaa !11
  br label %91

91:                                               ; preds = %79, %84, %88
  %92 = phi i32 [ %90, %88 ], [ %81, %84 ], [ %81, %79 ]
  %93 = phi i32* [ %89, %88 ], [ %80, %84 ], [ %80, %79 ]
  %94 = phi i32 [ 1, %88 ], [ %26, %84 ], [ %26, %79 ]
  %95 = phi i32 [ %82, %88 ], [ -1, %84 ], [ -1, %79 ]
  %96 = add i32 %92, -32
  %97 = icmp ult i32 %96, 32
  br i1 %97, label %98, label %269

98:                                               ; preds = %91
  %99 = shl nuw i32 1, %96
  %100 = and i32 %99, 75913
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %115, label %106

102:                                              ; preds = %106
  %103 = shl nuw i32 1, %113
  %104 = and i32 %103, 75913
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %115, label %106

106:                                              ; preds = %98, %102
  %107 = phi i32 [ %103, %102 ], [ %99, %98 ]
  %108 = phi i32* [ %111, %102 ], [ %93, %98 ]
  %109 = phi i32 [ %110, %102 ], [ 0, %98 ]
  %110 = or i32 %107, %109
  %111 = getelementptr inbounds i32, i32* %108, i64 1
  %112 = load i32, i32* %111, align 4, !tbaa !11
  %113 = add i32 %112, -32
  %114 = icmp ult i32 %113, 32
  br i1 %114, label %102, label %269

115:                                              ; preds = %102, %98
  %116 = phi i32 [ %92, %98 ], [ %112, %102 ]
  %117 = phi i32 [ 0, %98 ], [ %110, %102 ]
  %118 = phi i32* [ %93, %98 ], [ %111, %102 ]
  %119 = icmp eq i32 %116, 42
  br i1 %119, label %120, label %166

120:                                              ; preds = %115
  %121 = getelementptr inbounds i32, i32* %118, i64 1
  %122 = load i32, i32* %121, align 4, !tbaa !11
  %123 = add i32 %122, -48
  %124 = icmp ult i32 %123, 10
  br i1 %124, label %125, label %140

125:                                              ; preds = %120
  %126 = getelementptr inbounds i32, i32* %118, i64 2
  %127 = load i32, i32* %126, align 4, !tbaa !11
  %128 = icmp eq i32 %127, 36
  br i1 %128, label %129, label %140

129:                                              ; preds = %125
  %130 = zext i32 %123 to i64
  %131 = getelementptr inbounds i32, i32* %4, i64 %130
  store i32 10, i32* %131, align 4, !tbaa !11
  %132 = load i32, i32* %121, align 4, !tbaa !11
  %133 = add nsw i32 %132, -48
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds %union.arg, %union.arg* %3, i64 %134
  %136 = bitcast %union.arg* %135 to i64*
  %137 = load i64, i64* %136, align 16, !tbaa !12
  %138 = trunc i64 %137 to i32
  %139 = getelementptr inbounds i32, i32* %118, i64 3
  br label %158

140:                                              ; preds = %125, %120
  %141 = icmp eq i32 %94, 0
  br i1 %141, label %142, label %542

142:                                              ; preds = %140
  br i1 %12, label %195, label %143

143:                                              ; preds = %142
  %144 = load i32, i32* %14, align 8
  %145 = icmp ult i32 %144, 41
  br i1 %145, label %146, label %151

146:                                              ; preds = %143
  %147 = load i8*, i8** %16, align 8
  %148 = zext i32 %144 to i64
  %149 = getelementptr i8, i8* %147, i64 %148
  %150 = add nuw nsw i32 %144, 8
  store i32 %150, i32* %14, align 8
  br label %154

151:                                              ; preds = %143
  %152 = load i8*, i8** %15, align 8
  %153 = getelementptr i8, i8* %152, i64 8
  store i8* %153, i8** %15, align 8
  br label %154

154:                                              ; preds = %151, %146
  %155 = phi i8* [ %149, %146 ], [ %152, %151 ]
  %156 = bitcast i8* %155 to i32*
  %157 = load i32, i32* %156, align 4
  br label %158

158:                                              ; preds = %154, %129
  %159 = phi i32* [ %139, %129 ], [ %121, %154 ]
  %160 = phi i32 [ 1, %129 ], [ 0, %154 ]
  %161 = phi i32 [ %138, %129 ], [ %157, %154 ]
  %162 = icmp slt i32 %161, 0
  br i1 %162, label %163, label %195

163:                                              ; preds = %158
  %164 = or i32 %117, 8192
  %165 = sub nsw i32 0, %161
  br label %195

166:                                              ; preds = %115
  %167 = add nsw i32 %116, -48
  %168 = icmp ult i32 %167, 10
  br i1 %168, label %169, label %195

169:                                              ; preds = %166, %184
  %170 = phi i32 [ %185, %184 ], [ %167, %166 ]
  %171 = phi i32 [ %186, %184 ], [ 0, %166 ]
  %172 = phi i32* [ %187, %184 ], [ %118, %166 ]
  %173 = icmp ugt i32 %171, 214748364
  br i1 %173, label %188, label %174

174:                                              ; preds = %169
  %175 = mul nuw nsw i32 %171, 10
  %176 = sub nuw nsw i32 2147483647, %175
  %177 = icmp ugt i32 %170, %176
  %178 = add nuw nsw i32 %175, %170
  %179 = select i1 %177, i32 -1, i32 %178
  %180 = getelementptr inbounds i32, i32* %172, i64 1
  %181 = load i32, i32* %180, align 4, !tbaa !11
  %182 = add i32 %181, -48
  %183 = icmp ult i32 %182, 10
  br i1 %183, label %184, label %193

184:                                              ; preds = %174, %188
  %185 = phi i32 [ %182, %174 ], [ %191, %188 ]
  %186 = phi i32 [ %179, %174 ], [ -1, %188 ]
  %187 = phi i32* [ %180, %174 ], [ %189, %188 ]
  br label %169

188:                                              ; preds = %169
  %189 = getelementptr inbounds i32, i32* %172, i64 1
  %190 = load i32, i32* %189, align 4, !tbaa !11
  %191 = add i32 %190, -48
  %192 = icmp ult i32 %191, 10
  br i1 %192, label %184, label %542

193:                                              ; preds = %174
  %194 = icmp slt i32 %179, 0
  br i1 %194, label %542, label %195

195:                                              ; preds = %166, %142, %193, %158, %163
  %196 = phi i32* [ %118, %166 ], [ %121, %142 ], [ %180, %193 ], [ %159, %158 ], [ %159, %163 ]
  %197 = phi i32 [ %94, %166 ], [ 0, %142 ], [ %94, %193 ], [ %160, %158 ], [ %160, %163 ]
  %198 = phi i32 [ %117, %166 ], [ %117, %142 ], [ %117, %193 ], [ %117, %158 ], [ %164, %163 ]
  %199 = phi i32 [ 0, %166 ], [ 0, %142 ], [ %179, %193 ], [ %161, %158 ], [ %165, %163 ]
  %200 = load i32, i32* %196, align 4, !tbaa !11
  %201 = icmp eq i32 %200, 46
  br i1 %201, label %202, label %269

202:                                              ; preds = %195
  %203 = getelementptr inbounds i32, i32* %196, i64 1
  %204 = load i32, i32* %203, align 4, !tbaa !11
  %205 = icmp eq i32 %204, 42
  br i1 %205, label %206, label %249

206:                                              ; preds = %202
  %207 = getelementptr inbounds i32, i32* %196, i64 2
  %208 = load i32, i32* %207, align 4, !tbaa !11
  %209 = add i32 %208, -48
  %210 = icmp ult i32 %209, 10
  br i1 %210, label %211, label %226

211:                                              ; preds = %206
  %212 = getelementptr inbounds i32, i32* %196, i64 3
  %213 = load i32, i32* %212, align 4, !tbaa !11
  %214 = icmp eq i32 %213, 36
  br i1 %214, label %215, label %226

215:                                              ; preds = %211
  %216 = zext i32 %209 to i64
  %217 = getelementptr inbounds i32, i32* %4, i64 %216
  store i32 10, i32* %217, align 4, !tbaa !11
  %218 = load i32, i32* %207, align 4, !tbaa !11
  %219 = add nsw i32 %218, -48
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds %union.arg, %union.arg* %3, i64 %220
  %222 = bitcast %union.arg* %221 to i64*
  %223 = load i64, i64* %222, align 16, !tbaa !12
  %224 = trunc i64 %223 to i32
  %225 = getelementptr inbounds i32, i32* %196, i64 4
  br label %244

226:                                              ; preds = %211, %206
  %227 = icmp eq i32 %197, 0
  br i1 %227, label %228, label %542

228:                                              ; preds = %226
  br i1 %12, label %244, label %229

229:                                              ; preds = %228
  %230 = load i32, i32* %14, align 8
  %231 = icmp ult i32 %230, 41
  br i1 %231, label %232, label %237

232:                                              ; preds = %229
  %233 = load i8*, i8** %16, align 8
  %234 = zext i32 %230 to i64
  %235 = getelementptr i8, i8* %233, i64 %234
  %236 = add nuw nsw i32 %230, 8
  store i32 %236, i32* %14, align 8
  br label %240

237:                                              ; preds = %229
  %238 = load i8*, i8** %15, align 8
  %239 = getelementptr i8, i8* %238, i64 8
  store i8* %239, i8** %15, align 8
  br label %240

240:                                              ; preds = %237, %232
  %241 = phi i8* [ %235, %232 ], [ %238, %237 ]
  %242 = bitcast i8* %241 to i32*
  %243 = load i32, i32* %242, align 4
  br label %244

244:                                              ; preds = %240, %228, %215
  %245 = phi i32* [ %225, %215 ], [ %207, %228 ], [ %207, %240 ]
  %246 = phi i32 [ %224, %215 ], [ 0, %228 ], [ %243, %240 ]
  %247 = xor i32 %246, -1
  %248 = lshr i32 %247, 31
  br label %269

249:                                              ; preds = %202
  %250 = add i32 %204, -48
  %251 = icmp ult i32 %250, 10
  br i1 %251, label %252, label %269

252:                                              ; preds = %249, %263
  %253 = phi i32 [ %267, %263 ], [ %250, %249 ]
  %254 = phi i32 [ %264, %263 ], [ 0, %249 ]
  %255 = phi i32* [ %265, %263 ], [ %203, %249 ]
  %256 = icmp ugt i32 %254, 214748364
  br i1 %256, label %263, label %257

257:                                              ; preds = %252
  %258 = mul nuw nsw i32 %254, 10
  %259 = sub nuw nsw i32 2147483647, %258
  %260 = icmp ugt i32 %253, %259
  %261 = add nuw nsw i32 %258, %253
  %262 = select i1 %260, i32 -1, i32 %261
  br label %263

263:                                              ; preds = %257, %252
  %264 = phi i32 [ -1, %252 ], [ %262, %257 ]
  %265 = getelementptr inbounds i32, i32* %255, i64 1
  %266 = load i32, i32* %265, align 4, !tbaa !11
  %267 = add i32 %266, -48
  %268 = icmp ult i32 %267, 10
  br i1 %268, label %252, label %269

269:                                              ; preds = %106, %263, %91, %249, %195, %244
  %270 = phi i32 [ %199, %244 ], [ %199, %195 ], [ %199, %249 ], [ 0, %91 ], [ %199, %263 ], [ 0, %106 ]
  %271 = phi i32 [ %198, %244 ], [ %198, %195 ], [ %198, %249 ], [ 0, %91 ], [ %198, %263 ], [ %110, %106 ]
  %272 = phi i32 [ %197, %244 ], [ %197, %195 ], [ %197, %249 ], [ %94, %91 ], [ %197, %263 ], [ %94, %106 ]
  %273 = phi i32* [ %245, %244 ], [ %196, %195 ], [ %203, %249 ], [ %93, %91 ], [ %265, %263 ], [ %111, %106 ]
  %274 = phi i32 [ %246, %244 ], [ -1, %195 ], [ 0, %249 ], [ -1, %91 ], [ %264, %263 ], [ -1, %106 ]
  %275 = phi i32 [ %248, %244 ], [ 0, %195 ], [ 1, %249 ], [ 0, %91 ], [ 1, %263 ], [ 0, %106 ]
  br label %276

276:                                              ; preds = %282, %269
  %277 = phi i32* [ %273, %269 ], [ %284, %282 ]
  %278 = phi i32 [ 0, %269 ], [ %289, %282 ]
  %279 = load i32, i32* %277, align 4, !tbaa !11
  %280 = add i32 %279, -123
  %281 = icmp ult i32 %280, -58
  br i1 %281, label %542, label %282

282:                                              ; preds = %276
  %283 = zext i32 %278 to i64
  %284 = getelementptr inbounds i32, i32* %277, i64 1
  %285 = add nsw i32 %279, -65
  %286 = zext i32 %285 to i64
  %287 = getelementptr inbounds [8 x [58 x i8]], [8 x [58 x i8]]* bitcast (<{ [58 x i8], [58 x i8], [58 x i8], [58 x i8], [58 x i8], <{ [46 x i8], [12 x i8] }>, [58 x i8], [58 x i8] }>* @states to [8 x [58 x i8]]*), i64 0, i64 %283, i64 %286
  %288 = load i8, i8* %287, align 1, !tbaa !12
  %289 = zext i8 %288 to i32
  %290 = add nsw i32 %289, -1
  %291 = icmp ult i32 %290, 8
  br i1 %291, label %276, label %292

292:                                              ; preds = %282
  %293 = zext i8 %288 to i32
  switch i8 %288, label %296 [
    i8 0, label %542
    i8 27, label %294
  ]

294:                                              ; preds = %292
  %295 = icmp sgt i32 %95, -1
  br i1 %295, label %542, label %305

296:                                              ; preds = %292
  %297 = icmp sgt i32 %95, -1
  br i1 %297, label %298, label %303

298:                                              ; preds = %296
  %299 = zext i32 %95 to i64
  %300 = getelementptr inbounds i32, i32* %4, i64 %299
  store i32 %293, i32* %300, align 4, !tbaa !11
  %301 = getelementptr inbounds %union.arg, %union.arg* %3, i64 %299
  %302 = bitcast %union.arg* %301 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %9, i8* noundef nonnull align 16 dereferenceable(16) %302, i64 16, i1 false) #10, !tbaa.struct !13
  br label %305

303:                                              ; preds = %296
  br i1 %12, label %545, label %304

304:                                              ; preds = %303
  call fastcc void @pop_arg(%union.arg* noundef nonnull %6, i32 noundef %293, [1 x %struct.__va_list_tag]* noundef %2) #11
  br label %306

305:                                              ; preds = %298, %294
  br i1 %12, label %338, label %306

306:                                              ; preds = %304, %305
  %307 = load i32, i32* %277, align 4, !tbaa !11
  %308 = icmp ne i32 %278, 0
  %309 = and i32 %307, 15
  %310 = icmp eq i32 %309, 3
  %311 = select i1 %308, i1 %310, i1 false
  %312 = and i32 %307, -33
  %313 = select i1 %311, i32 %312, i32 %307
  switch i32 %313, label %475 [
    i32 110, label %316
    i32 99, label %343
    i32 67, label %363
    i32 83, label %367
    i32 109, label %422
    i32 115, label %314
  ]

314:                                              ; preds = %306
  %315 = load i8*, i8** %17, align 16, !tbaa !12
  br label %426

316:                                              ; preds = %306
  %317 = trunc i32 %278 to i8
  switch i8 %317, label %338 [
    i8 0, label %318
    i8 1, label %320
    i8 2, label %323
    i8 3, label %326
    i8 4, label %329
    i8 6, label %332
    i8 7, label %335
  ]

318:                                              ; preds = %316
  %319 = load i32*, i32** %18, align 16, !tbaa !12
  store i32 %28, i32* %319, align 4, !tbaa !11
  br label %338

320:                                              ; preds = %316
  %321 = sext i32 %28 to i64
  %322 = load i64*, i64** %20, align 16, !tbaa !12
  store i64 %321, i64* %322, align 8, !tbaa !14
  br label %338

323:                                              ; preds = %316
  %324 = sext i32 %28 to i64
  %325 = load i64*, i64** %20, align 16, !tbaa !12
  store i64 %324, i64* %325, align 8, !tbaa !18
  br label %338

326:                                              ; preds = %316
  %327 = trunc i32 %28 to i16
  %328 = load i16*, i16** %21, align 16, !tbaa !12
  store i16 %327, i16* %328, align 2, !tbaa !20
  br label %338

329:                                              ; preds = %316
  %330 = trunc i32 %28 to i8
  %331 = load i8*, i8** %17, align 16, !tbaa !12
  store i8 %330, i8* %331, align 1, !tbaa !12
  br label %338

332:                                              ; preds = %316
  %333 = sext i32 %28 to i64
  %334 = load i64*, i64** %20, align 16, !tbaa !12
  store i64 %333, i64* %334, align 8, !tbaa !14
  br label %338

335:                                              ; preds = %316
  %336 = sext i32 %28 to i64
  %337 = load i64*, i64** %20, align 16, !tbaa !12
  store i64 %336, i64* %337, align 8, !tbaa !14
  br label %338

338:                                              ; preds = %390, %397, %511, %514, %479, %471, %472, %419, %383, %353, %360, %318, %320, %323, %326, %329, %332, %335, %316, %363, %77, %305
  %339 = phi i32* [ %284, %305 ], [ %284, %363 ], [ %49, %77 ], [ %284, %316 ], [ %284, %335 ], [ %284, %332 ], [ %284, %329 ], [ %284, %326 ], [ %284, %323 ], [ %284, %320 ], [ %284, %318 ], [ %284, %360 ], [ %284, %353 ], [ %284, %383 ], [ %284, %419 ], [ %284, %472 ], [ %284, %471 ], [ %284, %479 ], [ %284, %514 ], [ %284, %511 ], [ %284, %397 ], [ %284, %390 ]
  %340 = phi i32 [ %272, %305 ], [ %272, %363 ], [ %26, %77 ], [ %272, %316 ], [ %272, %335 ], [ %272, %332 ], [ %272, %329 ], [ %272, %326 ], [ %272, %323 ], [ %272, %320 ], [ %272, %318 ], [ %272, %360 ], [ %272, %353 ], [ %272, %383 ], [ %272, %419 ], [ %272, %472 ], [ %272, %471 ], [ %272, %479 ], [ %272, %514 ], [ %272, %511 ], [ %272, %397 ], [ %272, %390 ]
  %341 = phi i32 [ 0, %305 ], [ 1, %363 ], [ %59, %77 ], [ 0, %316 ], [ 0, %335 ], [ 0, %332 ], [ 0, %329 ], [ 0, %326 ], [ 0, %323 ], [ 0, %320 ], [ 0, %318 ], [ %345, %360 ], [ %345, %353 ], [ %380, %383 ], [ %380, %419 ], [ %453, %472 ], [ %453, %471 ], [ 0, %479 ], [ %516, %514 ], [ %513, %511 ], [ %380, %397 ], [ %380, %390 ]
  %342 = icmp sgt i32 %341, %55
  br i1 %342, label %542, label %23

343:                                              ; preds = %306
  %344 = icmp sgt i32 %270, 1
  %345 = select i1 %344, i32 %270, i32 1
  %346 = icmp ugt i32 %345, 1
  %347 = and i32 %271, 8192
  %348 = icmp eq i32 %347, 0
  %349 = select i1 %346, i1 %348, i1 false
  br i1 %349, label %350, label %353

350:                                              ; preds = %343
  %351 = add nsw i32 %345, -1
  %352 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull %0, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %351, i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #12
  br label %353

353:                                              ; preds = %350, %343
  %354 = load i64, i64* %19, align 16, !tbaa !12
  %355 = trunc i64 %354 to i32
  %356 = call i32 @btowc(i32 noundef %355) #12
  %357 = call i32 @fputwc(i32 noundef %356, %struct._IO_FILE* noundef nonnull %0) #12
  %358 = xor i1 %346, true
  %359 = select i1 %358, i1 true, i1 %348
  br i1 %359, label %338, label %360

360:                                              ; preds = %353
  %361 = add nsw i32 %345, -1
  %362 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull %0, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %361, i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #12
  br label %338

363:                                              ; preds = %306
  %364 = load i64, i64* %19, align 16, !tbaa !12
  %365 = trunc i64 %364 to i32
  %366 = call i32 @fputwc(i32 noundef %365, %struct._IO_FILE* noundef nonnull %0) #12
  br label %338

367:                                              ; preds = %306
  %368 = load i32*, i32** %18, align 16, !tbaa !12
  %369 = icmp slt i32 %274, 0
  %370 = select i1 %369, i32 2147483647, i32 %274
  %371 = zext i32 %370 to i64
  %372 = call i64 @wcsnlen(i32* noundef %368, i64 noundef %371) #12
  br i1 %369, label %373, label %377

373:                                              ; preds = %367
  %374 = getelementptr inbounds i32, i32* %368, i64 %372
  %375 = load i32, i32* %374, align 4, !tbaa !11
  %376 = icmp eq i32 %375, 0
  br i1 %376, label %377, label %542

377:                                              ; preds = %373, %367
  %378 = trunc i64 %372 to i32
  %379 = icmp slt i32 %270, %378
  %380 = select i1 %379, i32 %378, i32 %270
  %381 = and i32 %271, 8192
  %382 = icmp eq i32 %381, 0
  br i1 %382, label %383, label %402

383:                                              ; preds = %377
  %384 = sub nsw i32 %380, %378
  %385 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull %0, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %384, i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #12
  %386 = shl i64 %372, 32
  %387 = icmp eq i64 %386, 0
  br i1 %387, label %338, label %388

388:                                              ; preds = %383
  %389 = ashr exact i64 %386, 32
  br label %390

390:                                              ; preds = %388, %397
  %391 = phi i64 [ %393, %397 ], [ %389, %388 ]
  %392 = phi i32* [ %398, %397 ], [ %368, %388 ]
  %393 = add i64 %391, -1
  %394 = load i32, i32* %13, align 8, !tbaa !10
  %395 = and i32 %394, 32
  %396 = icmp eq i32 %395, 0
  br i1 %396, label %397, label %338

397:                                              ; preds = %390
  %398 = getelementptr inbounds i32, i32* %392, i64 1
  %399 = load i32, i32* %392, align 4, !tbaa !11
  %400 = call i32 @fputwc(i32 noundef %399, %struct._IO_FILE* noundef nonnull %0) #12
  %401 = icmp eq i64 %393, 0
  br i1 %401, label %338, label %390

402:                                              ; preds = %377
  %403 = shl i64 %372, 32
  %404 = icmp eq i64 %403, 0
  br i1 %404, label %419, label %405

405:                                              ; preds = %402
  %406 = ashr exact i64 %403, 32
  br label %407

407:                                              ; preds = %405, %414
  %408 = phi i64 [ %410, %414 ], [ %406, %405 ]
  %409 = phi i32* [ %415, %414 ], [ %368, %405 ]
  %410 = add i64 %408, -1
  %411 = load i32, i32* %13, align 8, !tbaa !10
  %412 = and i32 %411, 32
  %413 = icmp eq i32 %412, 0
  br i1 %413, label %414, label %419

414:                                              ; preds = %407
  %415 = getelementptr inbounds i32, i32* %409, i64 1
  %416 = load i32, i32* %409, align 4, !tbaa !11
  %417 = call i32 @fputwc(i32 noundef %416, %struct._IO_FILE* noundef nonnull %0) #12
  %418 = icmp eq i64 %410, 0
  br i1 %418, label %419, label %407

419:                                              ; preds = %407, %414, %402
  %420 = sub nsw i32 %380, %378
  %421 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull %0, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %420, i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #12
  br label %338

422:                                              ; preds = %306
  %423 = tail call i32* @___errno_location() #13
  %424 = load i32, i32* %423, align 4, !tbaa !11
  %425 = call i8* @strerror(i32 noundef %424) #12
  br label %426

426:                                              ; preds = %314, %422
  %427 = phi i8* [ %315, %314 ], [ %425, %422 ]
  %428 = icmp eq i8* %427, null
  %429 = select i1 %428, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i8* %427
  store i8* %429, i8** %17, align 16
  %430 = icmp slt i32 %274, 0
  %431 = select i1 %430, i32 2147483647, i32 %274
  %432 = icmp eq i32 %431, 0
  br i1 %432, label %445, label %433

433:                                              ; preds = %426, %438
  %434 = phi i8* [ %440, %438 ], [ %429, %426 ]
  %435 = phi i32 [ %441, %438 ], [ 0, %426 ]
  %436 = call i32 @mbtowc(i32* noundef nonnull %8, i8* noundef %434, i64 noundef 4) #12
  %437 = icmp sgt i32 %436, 0
  br i1 %437, label %438, label %443

438:                                              ; preds = %433
  %439 = zext i32 %436 to i64
  %440 = getelementptr inbounds i8, i8* %434, i64 %439
  %441 = add nuw nsw i32 %435, 1
  %442 = icmp eq i32 %441, %431
  br i1 %442, label %445, label %433

443:                                              ; preds = %433
  %444 = icmp slt i32 %436, 0
  br i1 %444, label %545, label %445

445:                                              ; preds = %438, %426, %443
  %446 = phi i32 [ %435, %443 ], [ 0, %426 ], [ %431, %438 ]
  %447 = phi i8* [ %434, %443 ], [ %429, %426 ], [ %440, %438 ]
  br i1 %430, label %448, label %451

448:                                              ; preds = %445
  %449 = load i8, i8* %447, align 1, !tbaa !12
  %450 = icmp eq i8 %449, 0
  br i1 %450, label %451, label %542

451:                                              ; preds = %448, %445
  %452 = icmp slt i32 %270, %446
  %453 = select i1 %452, i32 %446, i32 %270
  %454 = and i32 %271, 8192
  %455 = icmp eq i32 %454, 0
  br i1 %455, label %456, label %459

456:                                              ; preds = %451
  %457 = sub nsw i32 %453, %446
  %458 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull %0, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %457, i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #12
  br label %459

459:                                              ; preds = %456, %451
  %460 = icmp eq i32 %446, 0
  br i1 %460, label %471, label %461

461:                                              ; preds = %459, %461
  %462 = phi i8* [ %467, %461 ], [ %429, %459 ]
  %463 = phi i32 [ %464, %461 ], [ %446, %459 ]
  %464 = add nsw i32 %463, -1
  %465 = call i32 @mbtowc(i32* noundef nonnull %8, i8* noundef %462, i64 noundef 4) #12
  %466 = sext i32 %465 to i64
  %467 = getelementptr inbounds i8, i8* %462, i64 %466
  %468 = load i32, i32* %8, align 4, !tbaa !11
  %469 = call i32 @fputwc(i32 noundef %468, %struct._IO_FILE* noundef nonnull %0) #12
  %470 = icmp eq i32 %464, 0
  br i1 %470, label %471, label %461

471:                                              ; preds = %461, %459
  br i1 %455, label %338, label %472

472:                                              ; preds = %471
  %473 = sub nsw i32 %453, %446
  %474 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull %0, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %473, i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #12
  br label %338

475:                                              ; preds = %306
  %476 = icmp ne i32 %275, 0
  %477 = icmp slt i32 %274, 0
  %478 = select i1 %476, i1 %477, i1 false
  br i1 %478, label %542, label %479

479:                                              ; preds = %475
  %480 = lshr i32 %271, 3
  %481 = and i32 %480, 1
  %482 = xor i32 %481, 1
  %483 = zext i32 %482 to i64
  %484 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.4, i64 0, i64 %483
  %485 = lshr i32 %271, 11
  %486 = and i32 %485, 1
  %487 = xor i32 %486, 1
  %488 = zext i32 %487 to i64
  %489 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.5, i64 0, i64 %488
  %490 = lshr i32 %271, 13
  %491 = and i32 %490, 1
  %492 = xor i32 %491, 1
  %493 = zext i32 %492 to i64
  %494 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.6, i64 0, i64 %493
  %495 = and i32 %271, 1
  %496 = xor i32 %495, 1
  %497 = zext i32 %496 to i64
  %498 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.7, i64 0, i64 %497
  %499 = lshr i32 %271, 16
  %500 = and i32 %499, 1
  %501 = xor i32 %500, 1
  %502 = zext i32 %501 to i64
  %503 = getelementptr inbounds [2 x i8], [2 x i8]* @.str.8, i64 0, i64 %502
  %504 = or i32 %313, 32
  %505 = add nsw i32 %504, -97
  %506 = sext i32 %505 to i64
  %507 = getelementptr inbounds [24 x i8], [24 x i8]* @sizeprefix, i64 0, i64 %506
  %508 = load i8, i8* %507, align 1, !tbaa !12
  %509 = sext i8 %508 to i32
  %510 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef nonnull %10, i64 noundef 16, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i64 0, i64 0), i8* noundef nonnull %484, i8* noundef nonnull %489, i8* noundef nonnull %494, i8* noundef nonnull %498, i8* noundef nonnull %503, i32 noundef %509, i32 noundef %313) #12
  switch i32 %504, label %338 [
    i32 97, label %511
    i32 101, label %511
    i32 102, label %511
    i32 103, label %511
    i32 100, label %514
    i32 105, label %514
    i32 111, label %514
    i32 117, label %514
    i32 120, label %514
    i32 112, label %514
  ]

511:                                              ; preds = %479, %479, %479, %479
  %512 = load x86_fp80, x86_fp80* %22, align 16, !tbaa !12
  %513 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull %0, i8* noundef nonnull %10, i32 noundef %270, i32 noundef %274, x86_fp80 noundef %512) #12
  br label %338

514:                                              ; preds = %479, %479, %479, %479, %479, %479
  %515 = load i64, i64* %19, align 16, !tbaa !12
  %516 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull %0, i8* noundef nonnull %10, i32 noundef %270, i32 noundef %274, i64 noundef %515) #12
  br label %338

517:                                              ; preds = %23
  br i1 %12, label %518, label %545

518:                                              ; preds = %517
  %519 = icmp eq i32 %26, 0
  br i1 %519, label %545, label %520

520:                                              ; preds = %518, %525
  %521 = phi i64 [ %527, %525 ], [ 1, %518 ]
  %522 = getelementptr inbounds i32, i32* %4, i64 %521
  %523 = load i32, i32* %522, align 4, !tbaa !11
  %524 = icmp eq i32 %523, 0
  br i1 %524, label %529, label %525

525:                                              ; preds = %520
  %526 = getelementptr inbounds %union.arg, %union.arg* %3, i64 %521
  call fastcc void @pop_arg(%union.arg* noundef nonnull %526, i32 noundef %523, [1 x %struct.__va_list_tag]* noundef %2) #11
  %527 = add nuw nsw i64 %521, 1
  %528 = icmp eq i64 %527, 10
  br i1 %528, label %545, label %520

529:                                              ; preds = %520
  %530 = trunc i64 %521 to i32
  %531 = icmp ult i32 %530, 10
  br i1 %531, label %532, label %545

532:                                              ; preds = %529
  %533 = and i64 %521, 4294967295
  br label %537

534:                                              ; preds = %537
  %535 = add nuw nsw i64 %538, 1
  %536 = icmp eq i64 %535, 10
  br i1 %536, label %545, label %537

537:                                              ; preds = %532, %534
  %538 = phi i64 [ %533, %532 ], [ %535, %534 ]
  %539 = getelementptr inbounds i32, i32* %4, i64 %538
  %540 = load i32, i32* %539, align 4, !tbaa !11
  %541 = icmp eq i32 %540, 0
  br i1 %541, label %534, label %545

542:                                              ; preds = %338, %48, %193, %373, %448, %475, %140, %226, %294, %292, %188, %276
  %543 = phi i32 [ 22, %276 ], [ 75, %188 ], [ 22, %292 ], [ 22, %294 ], [ 22, %226 ], [ 22, %140 ], [ 75, %475 ], [ 75, %448 ], [ 75, %373 ], [ 75, %193 ], [ 75, %48 ], [ 75, %338 ]
  %544 = tail call i32* @___errno_location() #13
  store i32 %543, i32* %544, align 4, !tbaa !11
  br label %545

545:                                              ; preds = %443, %303, %525, %534, %537, %542, %529, %518, %517
  %546 = phi i32 [ %28, %517 ], [ 0, %518 ], [ 1, %529 ], [ -1, %542 ], [ 1, %534 ], [ -1, %537 ], [ 1, %525 ], [ -1, %443 ], [ 0, %303 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #9
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %10) #9
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %9) #9
  ret i32 %546
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #3

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @fwide(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define internal fastcc void @pop_arg(%union.arg* nocapture noundef writeonly %0, i32 noundef %1, [1 x %struct.__va_list_tag]* noundef %2) unnamed_addr #6 {
  switch i32 %1, label %352 [
    i32 9, label %4
    i32 10, label %23
    i32 11, label %43
    i32 13, label %63
    i32 14, label %82
    i32 12, label %101
    i32 15, label %120
    i32 16, label %142
    i32 17, label %163
    i32 18, label %185
    i32 19, label %206
    i32 20, label %225
    i32 21, label %244
    i32 22, label %263
    i32 23, label %282
    i32 24, label %301
    i32 25, label %321
    i32 26, label %341
  ]

4:                                                ; preds = %3
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %6 = load i32, i32* %5, align 8
  %7 = icmp ult i32 %6, 41
  br i1 %7, label %8, label %14

8:                                                ; preds = %4
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %10 = load i8*, i8** %9, align 8
  %11 = zext i32 %6 to i64
  %12 = getelementptr i8, i8* %10, i64 %11
  %13 = add nuw nsw i32 %6, 8
  store i32 %13, i32* %5, align 8
  br label %18

14:                                               ; preds = %4
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %16 = load i8*, i8** %15, align 8
  %17 = getelementptr i8, i8* %16, i64 8
  store i8* %17, i8** %15, align 8
  br label %18

18:                                               ; preds = %14, %8
  %19 = phi i8* [ %12, %8 ], [ %16, %14 ]
  %20 = bitcast i8* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  %22 = bitcast %union.arg* %0 to i8**
  store i8* %21, i8** %22, align 16, !tbaa !12
  br label %352

23:                                               ; preds = %3
  %24 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %25 = load i32, i32* %24, align 8
  %26 = icmp ult i32 %25, 41
  br i1 %26, label %27, label %33

27:                                               ; preds = %23
  %28 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %29 = load i8*, i8** %28, align 8
  %30 = zext i32 %25 to i64
  %31 = getelementptr i8, i8* %29, i64 %30
  %32 = add nuw nsw i32 %25, 8
  store i32 %32, i32* %24, align 8
  br label %37

33:                                               ; preds = %23
  %34 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %35 = load i8*, i8** %34, align 8
  %36 = getelementptr i8, i8* %35, i64 8
  store i8* %36, i8** %34, align 8
  br label %37

37:                                               ; preds = %33, %27
  %38 = phi i8* [ %31, %27 ], [ %35, %33 ]
  %39 = bitcast i8* %38 to i32*
  %40 = load i32, i32* %39, align 4
  %41 = sext i32 %40 to i64
  %42 = bitcast %union.arg* %0 to i64*
  store i64 %41, i64* %42, align 16, !tbaa !12
  br label %352

43:                                               ; preds = %3
  %44 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %45 = load i32, i32* %44, align 8
  %46 = icmp ult i32 %45, 41
  br i1 %46, label %47, label %53

47:                                               ; preds = %43
  %48 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %49 = load i8*, i8** %48, align 8
  %50 = zext i32 %45 to i64
  %51 = getelementptr i8, i8* %49, i64 %50
  %52 = add nuw nsw i32 %45, 8
  store i32 %52, i32* %44, align 8
  br label %57

53:                                               ; preds = %43
  %54 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %55 = load i8*, i8** %54, align 8
  %56 = getelementptr i8, i8* %55, i64 8
  store i8* %56, i8** %54, align 8
  br label %57

57:                                               ; preds = %53, %47
  %58 = phi i8* [ %51, %47 ], [ %55, %53 ]
  %59 = bitcast i8* %58 to i32*
  %60 = load i32, i32* %59, align 4
  %61 = zext i32 %60 to i64
  %62 = bitcast %union.arg* %0 to i64*
  store i64 %61, i64* %62, align 16, !tbaa !12
  br label %352

63:                                               ; preds = %3
  %64 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %65 = load i32, i32* %64, align 8
  %66 = icmp ult i32 %65, 41
  br i1 %66, label %67, label %73

67:                                               ; preds = %63
  %68 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %69 = load i8*, i8** %68, align 8
  %70 = zext i32 %65 to i64
  %71 = getelementptr i8, i8* %69, i64 %70
  %72 = add nuw nsw i32 %65, 8
  store i32 %72, i32* %64, align 8
  br label %77

73:                                               ; preds = %63
  %74 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %75 = load i8*, i8** %74, align 8
  %76 = getelementptr i8, i8* %75, i64 8
  store i8* %76, i8** %74, align 8
  br label %77

77:                                               ; preds = %73, %67
  %78 = phi i8* [ %71, %67 ], [ %75, %73 ]
  %79 = bitcast i8* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = bitcast %union.arg* %0 to i64*
  store i64 %80, i64* %81, align 16, !tbaa !12
  br label %352

82:                                               ; preds = %3
  %83 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %84 = load i32, i32* %83, align 8
  %85 = icmp ult i32 %84, 41
  br i1 %85, label %86, label %92

86:                                               ; preds = %82
  %87 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %88 = load i8*, i8** %87, align 8
  %89 = zext i32 %84 to i64
  %90 = getelementptr i8, i8* %88, i64 %89
  %91 = add nuw nsw i32 %84, 8
  store i32 %91, i32* %83, align 8
  br label %96

92:                                               ; preds = %82
  %93 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %94 = load i8*, i8** %93, align 8
  %95 = getelementptr i8, i8* %94, i64 8
  store i8* %95, i8** %93, align 8
  br label %96

96:                                               ; preds = %92, %86
  %97 = phi i8* [ %90, %86 ], [ %94, %92 ]
  %98 = bitcast i8* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = bitcast %union.arg* %0 to i64*
  store i64 %99, i64* %100, align 16, !tbaa !12
  br label %352

101:                                              ; preds = %3
  %102 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %103 = load i32, i32* %102, align 8
  %104 = icmp ult i32 %103, 41
  br i1 %104, label %105, label %111

105:                                              ; preds = %101
  %106 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %107 = load i8*, i8** %106, align 8
  %108 = zext i32 %103 to i64
  %109 = getelementptr i8, i8* %107, i64 %108
  %110 = add nuw nsw i32 %103, 8
  store i32 %110, i32* %102, align 8
  br label %115

111:                                              ; preds = %101
  %112 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %113 = load i8*, i8** %112, align 8
  %114 = getelementptr i8, i8* %113, i64 8
  store i8* %114, i8** %112, align 8
  br label %115

115:                                              ; preds = %111, %105
  %116 = phi i8* [ %109, %105 ], [ %113, %111 ]
  %117 = bitcast i8* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = bitcast %union.arg* %0 to i64*
  store i64 %118, i64* %119, align 16, !tbaa !12
  br label %352

120:                                              ; preds = %3
  %121 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %122 = load i32, i32* %121, align 8
  %123 = icmp ult i32 %122, 41
  br i1 %123, label %124, label %130

124:                                              ; preds = %120
  %125 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %126 = load i8*, i8** %125, align 8
  %127 = zext i32 %122 to i64
  %128 = getelementptr i8, i8* %126, i64 %127
  %129 = add nuw nsw i32 %122, 8
  store i32 %129, i32* %121, align 8
  br label %134

130:                                              ; preds = %120
  %131 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %132 = load i8*, i8** %131, align 8
  %133 = getelementptr i8, i8* %132, i64 8
  store i8* %133, i8** %131, align 8
  br label %134

134:                                              ; preds = %130, %124
  %135 = phi i8* [ %128, %124 ], [ %132, %130 ]
  %136 = bitcast i8* %135 to i32*
  %137 = load i32, i32* %136, align 4
  %138 = zext i32 %137 to i64
  %139 = shl i64 %138, 48
  %140 = ashr exact i64 %139, 48
  %141 = bitcast %union.arg* %0 to i64*
  store i64 %140, i64* %141, align 16, !tbaa !12
  br label %352

142:                                              ; preds = %3
  %143 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %144 = load i32, i32* %143, align 8
  %145 = icmp ult i32 %144, 41
  br i1 %145, label %146, label %152

146:                                              ; preds = %142
  %147 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %148 = load i8*, i8** %147, align 8
  %149 = zext i32 %144 to i64
  %150 = getelementptr i8, i8* %148, i64 %149
  %151 = add nuw nsw i32 %144, 8
  store i32 %151, i32* %143, align 8
  br label %156

152:                                              ; preds = %142
  %153 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %154 = load i8*, i8** %153, align 8
  %155 = getelementptr i8, i8* %154, i64 8
  store i8* %155, i8** %153, align 8
  br label %156

156:                                              ; preds = %152, %146
  %157 = phi i8* [ %150, %146 ], [ %154, %152 ]
  %158 = bitcast i8* %157 to i32*
  %159 = load i32, i32* %158, align 4
  %160 = and i32 %159, 65535
  %161 = zext i32 %160 to i64
  %162 = bitcast %union.arg* %0 to i64*
  store i64 %161, i64* %162, align 16, !tbaa !12
  br label %352

163:                                              ; preds = %3
  %164 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %165 = load i32, i32* %164, align 8
  %166 = icmp ult i32 %165, 41
  br i1 %166, label %167, label %173

167:                                              ; preds = %163
  %168 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %169 = load i8*, i8** %168, align 8
  %170 = zext i32 %165 to i64
  %171 = getelementptr i8, i8* %169, i64 %170
  %172 = add nuw nsw i32 %165, 8
  store i32 %172, i32* %164, align 8
  br label %177

173:                                              ; preds = %163
  %174 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %175 = load i8*, i8** %174, align 8
  %176 = getelementptr i8, i8* %175, i64 8
  store i8* %176, i8** %174, align 8
  br label %177

177:                                              ; preds = %173, %167
  %178 = phi i8* [ %171, %167 ], [ %175, %173 ]
  %179 = bitcast i8* %178 to i32*
  %180 = load i32, i32* %179, align 4
  %181 = zext i32 %180 to i64
  %182 = shl i64 %181, 56
  %183 = ashr exact i64 %182, 56
  %184 = bitcast %union.arg* %0 to i64*
  store i64 %183, i64* %184, align 16, !tbaa !12
  br label %352

185:                                              ; preds = %3
  %186 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %187 = load i32, i32* %186, align 8
  %188 = icmp ult i32 %187, 41
  br i1 %188, label %189, label %195

189:                                              ; preds = %185
  %190 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %191 = load i8*, i8** %190, align 8
  %192 = zext i32 %187 to i64
  %193 = getelementptr i8, i8* %191, i64 %192
  %194 = add nuw nsw i32 %187, 8
  store i32 %194, i32* %186, align 8
  br label %199

195:                                              ; preds = %185
  %196 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %197 = load i8*, i8** %196, align 8
  %198 = getelementptr i8, i8* %197, i64 8
  store i8* %198, i8** %196, align 8
  br label %199

199:                                              ; preds = %195, %189
  %200 = phi i8* [ %193, %189 ], [ %197, %195 ]
  %201 = bitcast i8* %200 to i32*
  %202 = load i32, i32* %201, align 4
  %203 = and i32 %202, 255
  %204 = zext i32 %203 to i64
  %205 = bitcast %union.arg* %0 to i64*
  store i64 %204, i64* %205, align 16, !tbaa !12
  br label %352

206:                                              ; preds = %3
  %207 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %208 = load i32, i32* %207, align 8
  %209 = icmp ult i32 %208, 41
  br i1 %209, label %210, label %216

210:                                              ; preds = %206
  %211 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %212 = load i8*, i8** %211, align 8
  %213 = zext i32 %208 to i64
  %214 = getelementptr i8, i8* %212, i64 %213
  %215 = add nuw nsw i32 %208, 8
  store i32 %215, i32* %207, align 8
  br label %220

216:                                              ; preds = %206
  %217 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %218 = load i8*, i8** %217, align 8
  %219 = getelementptr i8, i8* %218, i64 8
  store i8* %219, i8** %217, align 8
  br label %220

220:                                              ; preds = %216, %210
  %221 = phi i8* [ %214, %210 ], [ %218, %216 ]
  %222 = bitcast i8* %221 to i64*
  %223 = load i64, i64* %222, align 8
  %224 = bitcast %union.arg* %0 to i64*
  store i64 %223, i64* %224, align 16, !tbaa !12
  br label %352

225:                                              ; preds = %3
  %226 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %227 = load i32, i32* %226, align 8
  %228 = icmp ult i32 %227, 41
  br i1 %228, label %229, label %235

229:                                              ; preds = %225
  %230 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %231 = load i8*, i8** %230, align 8
  %232 = zext i32 %227 to i64
  %233 = getelementptr i8, i8* %231, i64 %232
  %234 = add nuw nsw i32 %227, 8
  store i32 %234, i32* %226, align 8
  br label %239

235:                                              ; preds = %225
  %236 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %237 = load i8*, i8** %236, align 8
  %238 = getelementptr i8, i8* %237, i64 8
  store i8* %238, i8** %236, align 8
  br label %239

239:                                              ; preds = %235, %229
  %240 = phi i8* [ %233, %229 ], [ %237, %235 ]
  %241 = bitcast i8* %240 to i64*
  %242 = load i64, i64* %241, align 8
  %243 = bitcast %union.arg* %0 to i64*
  store i64 %242, i64* %243, align 16, !tbaa !12
  br label %352

244:                                              ; preds = %3
  %245 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %246 = load i32, i32* %245, align 8
  %247 = icmp ult i32 %246, 41
  br i1 %247, label %248, label %254

248:                                              ; preds = %244
  %249 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %250 = load i8*, i8** %249, align 8
  %251 = zext i32 %246 to i64
  %252 = getelementptr i8, i8* %250, i64 %251
  %253 = add nuw nsw i32 %246, 8
  store i32 %253, i32* %245, align 8
  br label %258

254:                                              ; preds = %244
  %255 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %256 = load i8*, i8** %255, align 8
  %257 = getelementptr i8, i8* %256, i64 8
  store i8* %257, i8** %255, align 8
  br label %258

258:                                              ; preds = %254, %248
  %259 = phi i8* [ %252, %248 ], [ %256, %254 ]
  %260 = bitcast i8* %259 to i64*
  %261 = load i64, i64* %260, align 8
  %262 = bitcast %union.arg* %0 to i64*
  store i64 %261, i64* %262, align 16, !tbaa !12
  br label %352

263:                                              ; preds = %3
  %264 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %265 = load i32, i32* %264, align 8
  %266 = icmp ult i32 %265, 41
  br i1 %266, label %267, label %273

267:                                              ; preds = %263
  %268 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %269 = load i8*, i8** %268, align 8
  %270 = zext i32 %265 to i64
  %271 = getelementptr i8, i8* %269, i64 %270
  %272 = add nuw nsw i32 %265, 8
  store i32 %272, i32* %264, align 8
  br label %277

273:                                              ; preds = %263
  %274 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %275 = load i8*, i8** %274, align 8
  %276 = getelementptr i8, i8* %275, i64 8
  store i8* %276, i8** %274, align 8
  br label %277

277:                                              ; preds = %273, %267
  %278 = phi i8* [ %271, %267 ], [ %275, %273 ]
  %279 = bitcast i8* %278 to i64*
  %280 = load i64, i64* %279, align 8
  %281 = bitcast %union.arg* %0 to i64*
  store i64 %280, i64* %281, align 16, !tbaa !12
  br label %352

282:                                              ; preds = %3
  %283 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %284 = load i32, i32* %283, align 8
  %285 = icmp ult i32 %284, 41
  br i1 %285, label %286, label %292

286:                                              ; preds = %282
  %287 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %288 = load i8*, i8** %287, align 8
  %289 = zext i32 %284 to i64
  %290 = getelementptr i8, i8* %288, i64 %289
  %291 = add nuw nsw i32 %284, 8
  store i32 %291, i32* %283, align 8
  br label %296

292:                                              ; preds = %282
  %293 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %294 = load i8*, i8** %293, align 8
  %295 = getelementptr i8, i8* %294, i64 8
  store i8* %295, i8** %293, align 8
  br label %296

296:                                              ; preds = %292, %286
  %297 = phi i8* [ %290, %286 ], [ %294, %292 ]
  %298 = bitcast i8* %297 to i64*
  %299 = load i64, i64* %298, align 8
  %300 = bitcast %union.arg* %0 to i64*
  store i64 %299, i64* %300, align 16, !tbaa !12
  br label %352

301:                                              ; preds = %3
  %302 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %303 = load i32, i32* %302, align 8
  %304 = icmp ult i32 %303, 41
  br i1 %304, label %305, label %311

305:                                              ; preds = %301
  %306 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %307 = load i8*, i8** %306, align 8
  %308 = zext i32 %303 to i64
  %309 = getelementptr i8, i8* %307, i64 %308
  %310 = add nuw nsw i32 %303, 8
  store i32 %310, i32* %302, align 8
  br label %315

311:                                              ; preds = %301
  %312 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %313 = load i8*, i8** %312, align 8
  %314 = getelementptr i8, i8* %313, i64 8
  store i8* %314, i8** %312, align 8
  br label %315

315:                                              ; preds = %311, %305
  %316 = phi i8* [ %309, %305 ], [ %313, %311 ]
  %317 = bitcast i8* %316 to i8**
  %318 = load i8*, i8** %317, align 8
  %319 = ptrtoint i8* %318 to i64
  %320 = bitcast %union.arg* %0 to i64*
  store i64 %319, i64* %320, align 16, !tbaa !12
  br label %352

321:                                              ; preds = %3
  %322 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 1
  %323 = load i32, i32* %322, align 4
  %324 = icmp ult i32 %323, 161
  br i1 %324, label %325, label %331

325:                                              ; preds = %321
  %326 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %327 = load i8*, i8** %326, align 8
  %328 = zext i32 %323 to i64
  %329 = getelementptr i8, i8* %327, i64 %328
  %330 = add nuw nsw i32 %323, 16
  store i32 %330, i32* %322, align 4
  br label %335

331:                                              ; preds = %321
  %332 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %333 = load i8*, i8** %332, align 8
  %334 = getelementptr i8, i8* %333, i64 8
  store i8* %334, i8** %332, align 8
  br label %335

335:                                              ; preds = %331, %325
  %336 = phi i8* [ %329, %325 ], [ %333, %331 ]
  %337 = bitcast i8* %336 to double*
  %338 = load double, double* %337, align 8
  %339 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %338, metadata !"fpexcept.ignore") #10
  %340 = getelementptr %union.arg, %union.arg* %0, i64 0, i32 0
  store x86_fp80 %339, x86_fp80* %340, align 16, !tbaa !12
  br label %352

341:                                              ; preds = %3
  %342 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %343 = load i8*, i8** %342, align 8
  %344 = ptrtoint i8* %343 to i64
  %345 = add i64 %344, 15
  %346 = and i64 %345, -16
  %347 = inttoptr i64 %346 to i8*
  %348 = inttoptr i64 %346 to x86_fp80*
  %349 = getelementptr i8, i8* %347, i64 16
  store i8* %349, i8** %342, align 8
  %350 = load x86_fp80, x86_fp80* %348, align 16
  %351 = getelementptr %union.arg, %union.arg* %0, i64 0, i32 0
  store x86_fp80 %350, x86_fp80* %351, align 16, !tbaa !12
  br label %352

352:                                              ; preds = %341, %3, %335, %315, %296, %277, %258, %239, %220, %199, %177, %156, %134, %115, %96, %77, %57, %37, %18
  ret void
}

; Function Attrs: optsize
declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @fputwc(i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @btowc(i32 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i64 @wcsnlen(i32* noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i8* @strerror(i32 noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #7

; Function Attrs: optsize
declare i32 @mbtowc(i32* noundef, i8* noundef, i64 noundef) local_unnamed_addr #4

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #4

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #8

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { mustprogress nofree nosync nounwind willreturn }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #6 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #9 = { nounwind strictfp }
attributes #10 = { strictfp }
attributes #11 = { nobuiltin optsize strictfp "no-builtins" }
attributes #12 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #13 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 140}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !5, i64 0}
!11 = !{!5, !5, i64 0}
!12 = !{!6, !6, i64 0}
!13 = !{i64 0, i64 8, !14, i64 0, i64 16, !15, i64 0, i64 8, !17}
!14 = !{!9, !9, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"long double", !6, i64 0}
!17 = !{!8, !8, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"long long", !6, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"short", !6, i64 0}
