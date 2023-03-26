; ModuleID = 'src/regex/regcomp.c'
source_filename = "src/regex/regcomp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i8, i8* }
%struct.re_pattern_buffer = type { i64, i8*, [4 x i8*], i64, i8 }
%struct.tre_ast_node_t = type { i32, i8*, i32, i32, i32, i32, %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t* }
%struct.tre_pos_and_tags_t = type { i32, i32, i32, i32*, i32, i64, i64*, i32 }
%struct.tre_parse_ctx_t = type { %struct.tre_mem_struct*, %struct.tre_stack_rec*, %struct.tre_ast_node_t*, i8*, i8*, i32, i32, i32, i32 }
%struct.tre_mem_struct = type { %struct.tre_list*, %struct.tre_list*, i8*, i64, i32, i8** }
%struct.tre_list = type { i8*, %struct.tre_list* }
%struct.tre_stack_rec = type { i32, i32, i32, i32, %union.tre_stack_item* }
%union.tre_stack_item = type { i8* }
%struct.tnfa = type { %struct.tnfa_transition*, i32, %struct.tnfa_transition*, %struct.tnfa_transition*, %struct.tre_submatch_data*, i8*, i32, i32, i32*, i32*, i32, i32, i32, i32, i32, i32, i32 }
%struct.tnfa_transition = type { i32, i32, %struct.tnfa_transition*, i32, i32*, i32, %union.anon, i64* }
%union.anon = type { i64 }
%struct.tre_submatch_data = type { i32, i32, i32* }
%struct.tre_literal_t = type { i64, i64, i32, i64, i64* }
%struct.tre_union_t = type { %struct.tre_ast_node_t*, %struct.tre_ast_node_t* }
%struct.tre_catenation_t = type { %struct.tre_ast_node_t*, %struct.tre_ast_node_t* }
%struct.tre_iteration_t = type { %struct.tre_ast_node_t*, i32, i32, i8 }
%struct.tre_tag_states_t = type { i32, i32 }
%struct.literals = type { %struct.tre_mem_struct*, %struct.tre_literal_t**, i32, i32 }
%struct.neg = type { i32, i32, [64 x i64] }

@tre_macros = internal unnamed_addr constant [13 x %struct.anon] [%struct.anon { i8 116, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0) }, %struct.anon { i8 110, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0) }, %struct.anon { i8 114, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0) }, %struct.anon { i8 102, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0) }, %struct.anon { i8 97, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0) }, %struct.anon { i8 101, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0) }, %struct.anon { i8 119, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i32 0, i32 0) }, %struct.anon { i8 87, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i32 0, i32 0) }, %struct.anon { i8 115, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i32 0, i32 0) }, %struct.anon { i8 83, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.9, i32 0, i32 0) }, %struct.anon { i8 100, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i32 0, i32 0) }, %struct.anon { i8 68, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.11, i32 0, i32 0) }, %struct.anon zeroinitializer], align 16
@.str = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0D\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\07\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\1B\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"[[:alnum:]_]\00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"[^[:alnum:]_]\00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c"[[:space:]]\00", align 1
@.str.9 = private unnamed_addr constant [13 x i8] c"[^[:space:]]\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"[[:digit:]]\00", align 1
@.str.11 = private unnamed_addr constant [13 x i8] c"[^[:digit:]]\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @regcomp(%struct.re_pattern_buffer* noalias nocapture noundef %0, i8* noalias noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.tre_ast_node_t*, align 8
  %7 = alloca %struct.tre_ast_node_t*, align 8
  %8 = alloca %struct.tre_ast_node_t*, align 8
  %9 = alloca %struct.tre_parse_ctx_t, align 8
  %10 = bitcast %struct.tre_parse_ctx_t* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %10) #5
  %11 = tail call i8* @malloc(i64 noundef 24) #6
  %12 = bitcast i8* %11 to %struct.tre_stack_rec*
  %13 = icmp eq i8* %11, null
  br i1 %13, label %850, label %14

14:                                               ; preds = %3
  %15 = tail call i8* @malloc(i64 noundef 4096) #6
  %16 = getelementptr inbounds i8, i8* %11, i64 16
  %17 = bitcast i8* %16 to i8**
  store i8* %15, i8** %17, align 8, !tbaa !3
  %18 = icmp eq i8* %15, null
  br i1 %18, label %19, label %20

19:                                               ; preds = %14
  tail call void @free(i8* noundef nonnull %11) #6
  br label %850

20:                                               ; preds = %14
  %21 = getelementptr inbounds i8, i8* %11, i64 12
  %22 = bitcast i8* %21 to i32*
  %23 = bitcast i8* %11 to <4 x i32>*
  store <4 x i32> <i32 512, i32 1024000, i32 128, i32 0>, <4 x i32>* %23, align 8, !tbaa !9
  %24 = tail call %struct.tre_mem_struct* @__tre_mem_new_impl(i32 noundef 0, i8* noundef null) #6
  %25 = icmp eq %struct.tre_mem_struct* %24, null
  br i1 %25, label %26, label %28

26:                                               ; preds = %20
  %27 = load i8*, i8** %17, align 8, !tbaa !3
  tail call void @free(i8* noundef %27) #6
  tail call void @free(i8* noundef nonnull %11) #6
  br label %850

28:                                               ; preds = %20
  %29 = call i8* @memset(i8* noundef nonnull %10, i32 noundef 0, i64 noundef 56) #6
  %30 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %9, i64 0, i32 0
  store %struct.tre_mem_struct* %24, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %31 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %9, i64 0, i32 1
  %32 = bitcast %struct.tre_stack_rec** %31 to i8**
  store i8* %11, i8** %32, align 8, !tbaa !12
  %33 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %9, i64 0, i32 4
  store i8* %1, i8** %33, align 8, !tbaa !13
  %34 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %9, i64 0, i32 8
  store i32 %2, i32* %34, align 4, !tbaa !14
  %35 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %9, i64 0, i32 7
  store i32 -1, i32* %35, align 8, !tbaa !15
  %36 = and i32 %2, 1
  %37 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* null) #6
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %834

39:                                               ; preds = %28
  %40 = icmp ne i32 %36, 0
  %41 = select i1 %40, i64 1, i64 2
  %42 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %9, i64 0, i32 3
  %43 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %9, i64 0, i32 2
  %44 = icmp eq i32 %36, 0
  %45 = bitcast i8* %16 to %union.tre_stack_item**
  %46 = xor i1 %40, true
  br label %77

47:                                               ; preds = %320, %77
  %48 = phi %struct.tre_ast_node_t* [ null, %77 ], [ %321, %320 ]
  %49 = phi i8* [ %78, %77 ], [ %322, %320 ]
  %50 = phi i32 [ %80, %77 ], [ %99, %320 ]
  %51 = phi %struct.tre_ast_node_t* [ null, %77 ], [ %323, %320 ]
  %52 = load i8, i8* %49, align 1, !tbaa !16
  br i1 %40, label %58, label %53

53:                                               ; preds = %47
  %54 = icmp eq i8 %52, 92
  br i1 %54, label %55, label %89

55:                                               ; preds = %53
  %56 = getelementptr inbounds i8, i8* %49, i64 1
  %57 = load i8, i8* %56, align 1, !tbaa !16
  switch i8 %57, label %89 [
    i8 40, label %60
    i8 41, label %85
  ]

58:                                               ; preds = %47
  %59 = icmp eq i8 %52, 40
  br i1 %59, label %60, label %81

60:                                               ; preds = %55, %58
  %61 = bitcast %struct.tre_ast_node_t* %48 to i8*
  %62 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* %61) #6
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %834

64:                                               ; preds = %60
  %65 = bitcast %struct.tre_ast_node_t* %51 to i8*
  %66 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* %65) #6
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %834

68:                                               ; preds = %64
  %69 = zext i32 %79 to i64
  %70 = inttoptr i64 %69 to i8*
  %71 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* nonnull %70) #6
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %834

73:                                               ; preds = %68
  %74 = add nuw nsw i32 %79, 1
  %75 = getelementptr inbounds i8, i8* %49, i64 %41
  %76 = add nsw i32 %50, 1
  store i8* %75, i8** %33, align 8, !tbaa !13
  br label %77

77:                                               ; preds = %39, %73
  %78 = phi i8* [ %1, %39 ], [ %75, %73 ]
  %79 = phi i32 [ 1, %39 ], [ %74, %73 ]
  %80 = phi i32 [ 0, %39 ], [ %76, %73 ]
  br label %47

81:                                               ; preds = %58
  %82 = icmp eq i8 %52, 41
  %83 = icmp ne i32 %50, 0
  %84 = select i1 %82, i1 %83, i1 false
  br i1 %84, label %85, label %89

85:                                               ; preds = %55, %81
  %86 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %87 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %86, i32 noundef -1, i32 noundef -1, i32 noundef -1) #6
  store %struct.tre_ast_node_t* %87, %struct.tre_ast_node_t** %43, align 8, !tbaa !17
  %88 = icmp eq %struct.tre_ast_node_t* %87, null
  br i1 %88, label %834, label %94

89:                                               ; preds = %55, %53, %81
  %90 = call fastcc i32 @parse_atom(%struct.tre_parse_ctx_t* noundef nonnull %9, i8* noundef nonnull %49) #6
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %834

92:                                               ; preds = %89
  %93 = load i8*, i8** %42, align 8, !tbaa !18
  br label %94

94:                                               ; preds = %92, %85
  %95 = phi i8* [ %49, %85 ], [ %93, %92 ]
  br label %96

96:                                               ; preds = %94, %324
  %97 = phi %struct.tre_ast_node_t* [ %336, %324 ], [ %48, %94 ]
  %98 = phi i8* [ %279, %324 ], [ %95, %94 ]
  %99 = phi i32 [ %280, %324 ], [ %50, %94 ]
  %100 = phi %struct.tre_ast_node_t* [ %331, %324 ], [ %51, %94 ]
  br label %101

101:                                              ; preds = %219, %96
  %102 = phi i8* [ %98, %96 ], [ %221, %219 ]
  %103 = load i8, i8* %102, align 1, !tbaa !16
  switch i8 %103, label %104 [
    i8 92, label %110
    i8 42, label %110
  ]

104:                                              ; preds = %101
  br i1 %40, label %105, label %223

105:                                              ; preds = %104
  switch i8 %103, label %106 [
    i8 43, label %110
    i8 63, label %110
    i8 123, label %110
  ]

106:                                              ; preds = %105
  %107 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %108 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %43, align 8, !tbaa !17
  %109 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_catenation(%struct.tre_mem_struct* noundef %107, %struct.tre_ast_node_t* noundef %100, %struct.tre_ast_node_t* noundef %108) #6
  br label %232

110:                                              ; preds = %105, %105, %105, %101, %101
  %111 = icmp eq i8 %103, 92
  %112 = and i1 %40, %111
  br i1 %112, label %228, label %113

113:                                              ; preds = %110
  br i1 %111, label %114, label %117

114:                                              ; preds = %113
  %115 = getelementptr inbounds i8, i8* %102, i64 1
  %116 = load i8, i8* %115, align 1, !tbaa !16
  switch i8 %116, label %228 [
    i8 43, label %117
    i8 63, label %117
    i8 123, label %117
  ]

117:                                              ; preds = %114, %114, %114, %113
  %118 = zext i1 %111 to i64
  %119 = getelementptr i8, i8* %102, i64 %118
  %120 = load i8*, i8** %33, align 8
  %121 = getelementptr inbounds i8, i8* %120, i64 1
  %122 = icmp eq i8* %119, %121
  %123 = select i1 %46, i1 %122, i1 false
  br i1 %123, label %124, label %128

124:                                              ; preds = %117
  %125 = getelementptr inbounds i8, i8* %119, i64 -1
  %126 = load i8, i8* %125, align 1, !tbaa !16
  %127 = icmp eq i8 %126, 94
  br i1 %127, label %223, label %128

128:                                              ; preds = %124, %117
  %129 = load i8, i8* %119, align 1, !tbaa !16
  switch i8 %129, label %201 [
    i8 123, label %130
    i8 43, label %202
    i8 63, label %200
  ]

130:                                              ; preds = %128
  %131 = getelementptr inbounds i8, i8* %119, i64 1
  %132 = load i8, i8* %131, align 1, !tbaa !16
  %133 = sext i8 %132 to i32
  %134 = add nsw i32 %133, -48
  %135 = icmp ult i32 %134, 10
  br i1 %135, label %136, label %151

136:                                              ; preds = %130, %136
  %137 = phi i8 [ %145, %136 ], [ %132, %130 ]
  %138 = phi i32 [ %143, %136 ], [ 0, %130 ]
  %139 = phi i8* [ %144, %136 ], [ %131, %130 ]
  %140 = mul nsw i32 %138, 10
  %141 = sext i8 %137 to i32
  %142 = add nsw i32 %141, -48
  %143 = add i32 %142, %140
  %144 = getelementptr inbounds i8, i8* %139, i64 1
  %145 = load i8, i8* %144, align 1, !tbaa !16
  %146 = sext i8 %145 to i32
  %147 = add nsw i32 %146, -58
  %148 = icmp ult i32 %147, -10
  %149 = icmp sgt i32 %143, 255
  %150 = select i1 %148, i1 true, i1 %149
  br i1 %150, label %151, label %136

151:                                              ; preds = %136, %130
  %152 = phi i8 [ %132, %130 ], [ %145, %136 ]
  %153 = phi i32 [ -1, %130 ], [ %143, %136 ]
  %154 = phi i8* [ %131, %130 ], [ %144, %136 ]
  %155 = icmp eq i8 %152, 44
  br i1 %155, label %156, label %177

156:                                              ; preds = %151
  %157 = getelementptr inbounds i8, i8* %154, i64 1
  %158 = load i8, i8* %157, align 1, !tbaa !16
  %159 = sext i8 %158 to i32
  %160 = add nsw i32 %159, -48
  %161 = icmp ult i32 %160, 10
  br i1 %161, label %162, label %177

162:                                              ; preds = %156, %162
  %163 = phi i8 [ %171, %162 ], [ %158, %156 ]
  %164 = phi i32 [ %169, %162 ], [ 0, %156 ]
  %165 = phi i8* [ %170, %162 ], [ %157, %156 ]
  %166 = mul nsw i32 %164, 10
  %167 = sext i8 %163 to i32
  %168 = add nsw i32 %167, -48
  %169 = add i32 %168, %166
  %170 = getelementptr inbounds i8, i8* %165, i64 1
  %171 = load i8, i8* %170, align 1, !tbaa !16
  %172 = sext i8 %171 to i32
  %173 = add nsw i32 %172, -58
  %174 = icmp ult i32 %173, -10
  %175 = icmp sgt i32 %169, 255
  %176 = select i1 %174, i1 true, i1 %175
  br i1 %176, label %177, label %162

177:                                              ; preds = %162, %156, %151
  %178 = phi i8 [ %158, %156 ], [ %152, %151 ], [ %171, %162 ]
  %179 = phi i32 [ -1, %156 ], [ %153, %151 ], [ %169, %162 ]
  %180 = phi i8* [ %157, %156 ], [ %154, %151 ], [ %170, %162 ]
  %181 = icmp slt i32 %179, %153
  %182 = icmp sgt i32 %179, -1
  %183 = and i1 %181, %182
  %184 = icmp sgt i32 %179, 255
  %185 = or i1 %184, %183
  %186 = icmp sgt i32 %153, 255
  %187 = select i1 %185, i1 true, i1 %186
  %188 = icmp slt i32 %153, 0
  %189 = select i1 %187, i1 true, i1 %188
  br i1 %189, label %834, label %190

190:                                              ; preds = %177
  br i1 %44, label %191, label %196

191:                                              ; preds = %190
  %192 = getelementptr inbounds i8, i8* %180, i64 1
  %193 = icmp eq i8 %178, 92
  br i1 %193, label %194, label %834

194:                                              ; preds = %191
  %195 = load i8, i8* %192, align 1, !tbaa !16
  br label %196

196:                                              ; preds = %194, %190
  %197 = phi i8 [ %178, %190 ], [ %195, %194 ]
  %198 = phi i8* [ %180, %190 ], [ %192, %194 ]
  %199 = icmp eq i8 %197, 125
  br i1 %199, label %206, label %834

200:                                              ; preds = %128
  br label %202

201:                                              ; preds = %128
  br label %202

202:                                              ; preds = %201, %200, %128
  %203 = phi i32 [ 0, %200 ], [ 1, %128 ], [ 0, %201 ]
  %204 = phi i32 [ 1, %200 ], [ -1, %128 ], [ -1, %201 ]
  %205 = getelementptr inbounds i8, i8* %119, i64 1
  br label %212

206:                                              ; preds = %196
  %207 = getelementptr inbounds i8, i8* %198, i64 1
  %208 = icmp eq i32 %179, 0
  br i1 %208, label %209, label %212

209:                                              ; preds = %206
  %210 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %211 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %210, i32 noundef -1, i32 noundef -1, i32 noundef -1) #6
  br label %219

212:                                              ; preds = %206, %202
  %213 = phi i8* [ %205, %202 ], [ %207, %206 ]
  %214 = phi i32 [ %204, %202 ], [ %179, %206 ]
  %215 = phi i32 [ %203, %202 ], [ %153, %206 ]
  %216 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %217 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %43, align 8, !tbaa !17
  %218 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_iter(%struct.tre_mem_struct* noundef %216, %struct.tre_ast_node_t* noundef %217, i32 noundef %215, i32 noundef %214, i32 noundef 0) #6
  br label %219

219:                                              ; preds = %212, %209
  %220 = phi %struct.tre_ast_node_t* [ %218, %212 ], [ %211, %209 ]
  %221 = phi i8* [ %213, %212 ], [ %207, %209 ]
  store %struct.tre_ast_node_t* %220, %struct.tre_ast_node_t** %43, align 8, !tbaa !17
  %222 = icmp eq %struct.tre_ast_node_t* %220, null
  br i1 %222, label %834, label %101

223:                                              ; preds = %124, %104
  %224 = phi i8* [ %102, %104 ], [ %119, %124 ]
  %225 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %226 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %43, align 8, !tbaa !17
  %227 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_catenation(%struct.tre_mem_struct* noundef %225, %struct.tre_ast_node_t* noundef %100, %struct.tre_ast_node_t* noundef %226) #6
  br label %240

228:                                              ; preds = %114, %110
  %229 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %230 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %43, align 8, !tbaa !17
  %231 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_catenation(%struct.tre_mem_struct* noundef %229, %struct.tre_ast_node_t* noundef %100, %struct.tre_ast_node_t* noundef %230) #6
  br i1 %40, label %232, label %240

232:                                              ; preds = %228, %106
  %233 = phi %struct.tre_ast_node_t* [ %109, %106 ], [ %231, %228 ]
  %234 = load i8, i8* %102, align 1, !tbaa !16
  %235 = icmp eq i8 %234, 124
  br i1 %235, label %260, label %236

236:                                              ; preds = %232
  %237 = icmp eq i8 %234, 41
  %238 = icmp ne i32 %99, 0
  %239 = select i1 %237, i1 %238, i1 false
  br i1 %239, label %268, label %248

240:                                              ; preds = %228, %223
  %241 = phi %struct.tre_ast_node_t* [ %231, %228 ], [ %227, %223 ]
  %242 = phi i8* [ %102, %228 ], [ %224, %223 ]
  %243 = load i8, i8* %242, align 1, !tbaa !16
  %244 = icmp eq i8 %243, 92
  br i1 %244, label %245, label %248

245:                                              ; preds = %240
  %246 = getelementptr inbounds i8, i8* %242, i64 1
  %247 = load i8, i8* %246, align 1, !tbaa !16
  switch i8 %247, label %320 [
    i8 41, label %253
    i8 124, label %253
  ]

248:                                              ; preds = %240, %236
  %249 = phi i8 [ %243, %240 ], [ %234, %236 ]
  %250 = phi %struct.tre_ast_node_t* [ %241, %240 ], [ %233, %236 ]
  %251 = phi i8* [ %242, %240 ], [ %102, %236 ]
  %252 = icmp eq i8 %249, 0
  br i1 %252, label %268, label %320

253:                                              ; preds = %245, %245
  %254 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %255 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_union(%struct.tre_mem_struct* noundef %254, %struct.tre_ast_node_t* noundef %97, %struct.tre_ast_node_t* noundef %241) #6
  %256 = load i8, i8* %246, align 1, !tbaa !16
  %257 = icmp eq i8 %256, 124
  br i1 %257, label %258, label %264

258:                                              ; preds = %253
  %259 = getelementptr inbounds i8, i8* %242, i64 2
  br label %317

260:                                              ; preds = %232
  %261 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %262 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_union(%struct.tre_mem_struct* noundef %261, %struct.tre_ast_node_t* noundef %97, %struct.tre_ast_node_t* noundef %233) #6
  %263 = getelementptr inbounds i8, i8* %102, i64 1
  br label %317

264:                                              ; preds = %253
  %265 = icmp eq i32 %99, 0
  br i1 %265, label %834, label %266

266:                                              ; preds = %264
  %267 = getelementptr inbounds i8, i8* %242, i64 2
  br label %276

268:                                              ; preds = %248, %236
  %269 = phi i64 [ 0, %248 ], [ 1, %236 ]
  %270 = phi i8 [ 0, %248 ], [ 41, %236 ]
  %271 = phi %struct.tre_ast_node_t* [ %250, %248 ], [ %233, %236 ]
  %272 = phi i8* [ %251, %248 ], [ %102, %236 ]
  %273 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %274 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_union(%struct.tre_mem_struct* noundef %273, %struct.tre_ast_node_t* noundef %97, %struct.tre_ast_node_t* noundef %271) #6
  %275 = getelementptr i8, i8* %272, i64 %269
  br label %276

276:                                              ; preds = %268, %266
  %277 = phi %struct.tre_ast_node_t* [ %255, %266 ], [ %274, %268 ]
  %278 = phi i8 [ 92, %266 ], [ %270, %268 ]
  %279 = phi i8* [ %267, %266 ], [ %275, %268 ]
  %280 = add nsw i32 %99, -1
  %281 = load %union.tre_stack_item*, %union.tre_stack_item** %45, align 8, !tbaa !3
  %282 = load i32, i32* %22, align 4, !tbaa !19
  %283 = add nsw i32 %282, -1
  store i32 %283, i32* %22, align 4, !tbaa !19
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %281, i64 %284
  %286 = bitcast %union.tre_stack_item* %285 to i32*
  %287 = load i32, i32* %286, align 8, !tbaa !16
  %288 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %277, i64 0, i32 3
  %289 = load i32, i32* %288, align 4, !tbaa !20
  %290 = icmp sgt i32 %289, -1
  br i1 %290, label %294, label %291

291:                                              ; preds = %276
  %292 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %277, i64 0, i32 4
  %293 = load i32, i32* %292, align 8, !tbaa !22
  br label %306

294:                                              ; preds = %276
  %295 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %296 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %295, i32 noundef -1, i32 noundef -1, i32 noundef -1) #6
  %297 = icmp eq %struct.tre_ast_node_t* %296, null
  br i1 %297, label %834, label %298

298:                                              ; preds = %294
  %299 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !10
  %300 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_catenation(%struct.tre_mem_struct* noundef %299, %struct.tre_ast_node_t* noundef nonnull %296, %struct.tre_ast_node_t* noundef nonnull %277) #6
  %301 = icmp eq %struct.tre_ast_node_t* %300, null
  br i1 %301, label %834, label %302

302:                                              ; preds = %298
  %303 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %277, i64 0, i32 4
  %304 = load i32, i32* %303, align 8, !tbaa !22
  %305 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %300, i64 0, i32 4
  store i32 %304, i32* %305, align 8, !tbaa !22
  br label %306

306:                                              ; preds = %302, %291
  %307 = phi i32 [ %304, %302 ], [ %293, %291 ]
  %308 = phi %struct.tre_ast_node_t* [ %300, %302 ], [ %277, %291 ]
  %309 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %308, i64 0, i32 3
  store i32 %287, i32* %309, align 4, !tbaa !20
  %310 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %308, i64 0, i32 4
  %311 = add nsw i32 %307, 1
  store i32 %311, i32* %310, align 8, !tbaa !22
  store %struct.tre_ast_node_t* %308, %struct.tre_ast_node_t** %43, align 8, !tbaa !17
  %312 = icmp eq i8 %278, 0
  %313 = icmp slt i32 %99, 1
  %314 = select i1 %312, i1 %313, i1 false
  br i1 %314, label %337, label %315

315:                                              ; preds = %306
  %316 = select i1 %312, i1 true, i1 %313
  br i1 %316, label %834, label %324

317:                                              ; preds = %260, %258
  %318 = phi %struct.tre_ast_node_t* [ %262, %260 ], [ %255, %258 ]
  %319 = phi i8* [ %263, %260 ], [ %259, %258 ]
  store i8* %319, i8** %33, align 8, !tbaa !13
  br label %320

320:                                              ; preds = %245, %248, %317
  %321 = phi %struct.tre_ast_node_t* [ %318, %317 ], [ %97, %248 ], [ %97, %245 ]
  %322 = phi i8* [ %319, %317 ], [ %251, %248 ], [ %242, %245 ]
  %323 = phi %struct.tre_ast_node_t* [ null, %317 ], [ %250, %248 ], [ %241, %245 ]
  br label %47

324:                                              ; preds = %315
  %325 = load %union.tre_stack_item*, %union.tre_stack_item** %45, align 8, !tbaa !3
  %326 = load i32, i32* %22, align 4, !tbaa !19
  %327 = add nsw i32 %326, -1
  store i32 %327, i32* %22, align 4, !tbaa !19
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %325, i64 %328, i32 0
  %330 = bitcast i8** %329 to %struct.tre_ast_node_t**
  %331 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %330, align 8, !tbaa !16
  %332 = add nsw i32 %326, -2
  store i32 %332, i32* %22, align 4, !tbaa !19
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %325, i64 %333, i32 0
  %335 = bitcast i8** %334 to %struct.tre_ast_node_t**
  %336 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %335, align 8, !tbaa !16
  br label %96

337:                                              ; preds = %306
  %338 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %9, i64 0, i32 5
  store i32 %79, i32* %338, align 8, !tbaa !23
  %339 = add nsw i32 %79, -1
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %0, i64 0, i32 0
  store i64 %340, i64* %341, align 8, !tbaa !24
  %342 = load i32, i32* %35, align 8, !tbaa !15
  %343 = icmp slt i32 %342, %79
  br i1 %343, label %344, label %834

344:                                              ; preds = %337
  %345 = call i8* @calloc(i64 noundef 1, i64 noundef 104) #6
  %346 = bitcast i8* %345 to %struct.tnfa*
  %347 = icmp eq i8* %345, null
  br i1 %347, label %834, label %348

348:                                              ; preds = %344
  %349 = load i32, i32* %35, align 8, !tbaa !15
  %350 = xor i32 %349, -1
  %351 = lshr i32 %350, 31
  %352 = getelementptr inbounds i8, i8* %345, i64 92
  %353 = bitcast i8* %352 to i32*
  store i32 %351, i32* %353, align 4, !tbaa !27
  %354 = getelementptr inbounds i8, i8* %345, i64 96
  %355 = bitcast i8* %354 to i32*
  store i32 0, i32* %355, align 8, !tbaa !29
  %356 = load i32, i32* %338, align 8, !tbaa !23
  %357 = getelementptr inbounds i8, i8* %345, i64 52
  %358 = bitcast i8* %357 to i32*
  store i32 %356, i32* %358, align 4, !tbaa !30
  %359 = icmp sgt i32 %349, -1
  %360 = and i32 %2, 8
  %361 = icmp eq i32 %360, 0
  %362 = or i1 %361, %359
  br i1 %362, label %363, label %407

363:                                              ; preds = %348
  %364 = call fastcc i32 @tre_add_tags(%struct.tre_mem_struct* noundef null, %struct.tre_stack_rec* noundef nonnull %12, %struct.tre_ast_node_t* noundef nonnull %308, %struct.tnfa* noundef nonnull %346) #7
  %365 = icmp eq i32 %364, 0
  br i1 %365, label %366, label %834

366:                                              ; preds = %363
  %367 = getelementptr inbounds i8, i8* %345, i64 72
  %368 = bitcast i8* %367 to i32*
  %369 = load i32, i32* %368, align 8, !tbaa !31
  %370 = icmp sgt i32 %369, 0
  br i1 %370, label %371, label %387

371:                                              ; preds = %366
  %372 = add nuw nsw i32 %369, 1
  %373 = zext i32 %372 to i64
  %374 = shl nuw nsw i64 %373, 2
  %375 = call i8* @malloc(i64 noundef %374) #6
  %376 = icmp eq i8* %375, null
  br i1 %376, label %834, label %377

377:                                              ; preds = %371
  %378 = bitcast i8* %375 to i32*
  %379 = getelementptr inbounds i8, i8* %345, i64 56
  %380 = bitcast i8* %379 to i8**
  store i8* %375, i8** %380, align 8, !tbaa !32
  %381 = load i32, i32* %368, align 8, !tbaa !31
  %382 = add nsw i32 %381, 1
  %383 = sext i32 %382 to i64
  %384 = shl nsw i64 %383, 2
  %385 = call i8* @memset(i8* noundef nonnull %375, i32 noundef -1, i64 noundef %384) #6
  %386 = load i32, i32* %368, align 8, !tbaa !31
  br label %387

387:                                              ; preds = %377, %366
  %388 = phi i32 [ %386, %377 ], [ %369, %366 ]
  %389 = phi i32* [ %378, %377 ], [ null, %366 ]
  %390 = shl i32 %388, 1
  %391 = or i32 %390, 1
  %392 = zext i32 %391 to i64
  %393 = call i8* @calloc(i64 noundef %392, i64 noundef 4) #6
  %394 = getelementptr inbounds i8, i8* %345, i64 64
  %395 = bitcast i8* %394 to i8**
  store i8* %393, i8** %395, align 8, !tbaa !33
  %396 = icmp eq i8* %393, null
  br i1 %396, label %834, label %397

397:                                              ; preds = %387
  %398 = load i32, i32* %338, align 8, !tbaa !23
  %399 = zext i32 %398 to i64
  %400 = call i8* @calloc(i64 noundef %399, i64 noundef 16) #6
  %401 = icmp eq i8* %400, null
  br i1 %401, label %834, label %402

402:                                              ; preds = %397
  %403 = getelementptr inbounds i8, i8* %345, i64 32
  %404 = bitcast i8* %403 to i8**
  store i8* %400, i8** %404, align 8, !tbaa !34
  %405 = call fastcc i32 @tre_add_tags(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_stack_rec* noundef nonnull %12, %struct.tre_ast_node_t* noundef nonnull %308, %struct.tnfa* noundef nonnull %346) #7
  %406 = icmp eq i32 %405, 0
  br i1 %406, label %407, label %834

407:                                              ; preds = %348, %402
  %408 = phi i32* [ %389, %402 ], [ null, %348 ]
  %409 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %9, i64 0, i32 6
  %410 = load i32, i32* %22, align 4, !tbaa !19
  %411 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %411) #5
  %412 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %412) #5
  store i32 0, i32* %5, align 4, !tbaa !9
  %413 = bitcast %struct.tre_ast_node_t* %308 to i8*
  %414 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* %413) #6
  %415 = icmp eq i32 %414, 0
  br i1 %415, label %416, label %665

416:                                              ; preds = %407
  %417 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* null) #6
  %418 = icmp eq i32 %417, 0
  br i1 %418, label %419, label %665

419:                                              ; preds = %416
  %420 = bitcast %struct.tre_ast_node_t** %6 to i8*
  %421 = bitcast %struct.tre_ast_node_t** %7 to i8*
  %422 = bitcast %struct.tre_ast_node_t** %8 to i8*
  br label %423

423:                                              ; preds = %658, %419
  %424 = phi i32 [ 0, %419 ], [ %659, %658 ]
  %425 = phi i32 [ 0, %419 ], [ %660, %658 ]
  %426 = phi i32 [ 0, %419 ], [ %662, %658 ]
  %427 = phi i32 [ 0, %419 ], [ %661, %658 ]
  %428 = load i32, i32* %22, align 4, !tbaa !19
  %429 = icmp sgt i32 %428, %410
  br i1 %429, label %430, label %667

430:                                              ; preds = %423
  %431 = load %union.tre_stack_item*, %union.tre_stack_item** %45, align 8, !tbaa !3
  %432 = add nsw i32 %428, -1
  store i32 %432, i32* %22, align 4, !tbaa !19
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %431, i64 %433
  %435 = bitcast %union.tre_stack_item* %434 to i32*
  %436 = load i32, i32* %435, align 8, !tbaa !16
  %437 = add nsw i32 %428, -2
  store i32 %437, i32* %22, align 4, !tbaa !19
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %431, i64 %438, i32 0
  %440 = load i8*, i8** %439, align 8, !tbaa !16
  switch i32 %436, label %658 [
    i32 0, label %441
    i32 1, label %533
  ]

441:                                              ; preds = %430
  %442 = bitcast i8* %440 to i32*
  %443 = load i32, i32* %442, align 8, !tbaa !35
  switch i32 %443, label %658 [
    i32 0, label %444
    i32 3, label %460
    i32 1, label %479
    i32 2, label %498
  ]

444:                                              ; preds = %441
  %445 = getelementptr inbounds i8, i8* %440, i64 8
  %446 = bitcast i8* %445 to %struct.tre_literal_t**
  %447 = load %struct.tre_literal_t*, %struct.tre_literal_t** %446, align 8, !tbaa !36
  %448 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %447, i64 0, i32 0
  %449 = load i64, i64* %448, align 8, !tbaa !37
  %450 = icmp sgt i64 %449, -1
  %451 = icmp eq i64 %449, -4
  %452 = or i1 %450, %451
  br i1 %452, label %453, label %658

453:                                              ; preds = %444
  %454 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %447, i64 0, i32 2
  %455 = load i32, i32* %454, align 8, !tbaa !39
  %456 = add nsw i32 %455, %424
  store i32 %456, i32* %454, align 8, !tbaa !39
  %457 = load i32, i32* %5, align 4, !tbaa !9
  %458 = icmp sgt i32 %456, %457
  %459 = select i1 %458, i32 %456, i32 %457
  store i32 %459, i32* %5, align 4
  br label %658

460:                                              ; preds = %441
  %461 = getelementptr inbounds i8, i8* %440, i64 8
  %462 = bitcast i8* %461 to %struct.tre_union_t**
  %463 = load %struct.tre_union_t*, %struct.tre_union_t** %462, align 8, !tbaa !36
  %464 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %463, i64 0, i32 1
  %465 = bitcast %struct.tre_ast_node_t** %464 to i8**
  %466 = load i8*, i8** %465, align 8, !tbaa !40
  %467 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* %466) #6
  %468 = icmp eq i32 %467, 0
  br i1 %468, label %469, label %667

469:                                              ; preds = %460
  %470 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* null) #6
  %471 = icmp eq i32 %470, 0
  br i1 %471, label %472, label %667

472:                                              ; preds = %469
  %473 = bitcast %struct.tre_union_t* %463 to i8**
  %474 = load i8*, i8** %473, align 8, !tbaa !42
  %475 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* %474) #6
  %476 = icmp eq i32 %475, 0
  br i1 %476, label %477, label %667

477:                                              ; preds = %472
  %478 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* null) #6
  br label %658

479:                                              ; preds = %441
  %480 = getelementptr inbounds i8, i8* %440, i64 8
  %481 = bitcast i8* %480 to %struct.tre_catenation_t**
  %482 = load %struct.tre_catenation_t*, %struct.tre_catenation_t** %481, align 8, !tbaa !36
  %483 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %482, i64 0, i32 1
  %484 = bitcast %struct.tre_ast_node_t** %483 to i8**
  %485 = load i8*, i8** %484, align 8, !tbaa !40
  %486 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* %485) #6
  %487 = icmp eq i32 %486, 0
  br i1 %487, label %488, label %667

488:                                              ; preds = %479
  %489 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* null) #6
  %490 = icmp eq i32 %489, 0
  br i1 %490, label %491, label %667

491:                                              ; preds = %488
  %492 = bitcast %struct.tre_catenation_t* %482 to i8**
  %493 = load i8*, i8** %492, align 8, !tbaa !42
  %494 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* %493) #6
  %495 = icmp eq i32 %494, 0
  br i1 %495, label %496, label %667

496:                                              ; preds = %491
  %497 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* null) #6
  br label %658

498:                                              ; preds = %441
  %499 = getelementptr inbounds i8, i8* %440, i64 8
  %500 = bitcast i8* %499 to %struct.tre_iteration_t**
  %501 = load %struct.tre_iteration_t*, %struct.tre_iteration_t** %500, align 8, !tbaa !36
  %502 = zext i32 %425 to i64
  %503 = inttoptr i64 %502 to i8*
  %504 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* %503) #6
  %505 = icmp eq i32 %504, 0
  br i1 %505, label %506, label %667

506:                                              ; preds = %498
  %507 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* nonnull %440) #6
  %508 = icmp eq i32 %507, 0
  br i1 %508, label %509, label %667

509:                                              ; preds = %506
  %510 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* nonnull inttoptr (i64 1 to i8*)) #6
  %511 = icmp eq i32 %510, 0
  br i1 %511, label %512, label %667

512:                                              ; preds = %509
  %513 = bitcast %struct.tre_iteration_t* %501 to i8**
  %514 = load i8*, i8** %513, align 8, !tbaa !43
  %515 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* %514) #6
  %516 = icmp eq i32 %515, 0
  br i1 %516, label %517, label %667

517:                                              ; preds = %512
  %518 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %12, i8* null) #6
  %519 = icmp eq i32 %518, 0
  br i1 %519, label %520, label %667

520:                                              ; preds = %517
  %521 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %501, i64 0, i32 1
  %522 = load i32, i32* %521, align 8, !tbaa !45
  %523 = icmp sgt i32 %522, 1
  br i1 %523, label %528, label %524

524:                                              ; preds = %520
  %525 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %501, i64 0, i32 2
  %526 = load i32, i32* %525, align 4, !tbaa !46
  %527 = icmp sgt i32 %526, 1
  br i1 %527, label %528, label %529

528:                                              ; preds = %524, %520
  store i32 0, i32* %4, align 4, !tbaa !9
  br label %529

529:                                              ; preds = %528, %524
  %530 = phi i32 [ 0, %528 ], [ %424, %524 ]
  %531 = phi i32 [ 0, %528 ], [ %425, %524 ]
  %532 = add nsw i32 %427, 1
  br label %658

533:                                              ; preds = %430
  %534 = getelementptr inbounds i8, i8* %440, i64 8
  %535 = bitcast i8* %534 to i8**
  %536 = bitcast i8* %534 to %struct.tre_iteration_t**
  %537 = load %struct.tre_iteration_t*, %struct.tre_iteration_t** %536, align 8, !tbaa !36
  %538 = add nsw i32 %428, -3
  store i32 %538, i32* %22, align 4, !tbaa !19
  %539 = sext i32 %538 to i64
  %540 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %431, i64 %539
  %541 = bitcast %union.tre_stack_item* %540 to i32*
  %542 = load i32, i32* %541, align 8, !tbaa !16
  store i32 %542, i32* %4, align 4, !tbaa !9
  %543 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %537, i64 0, i32 1
  %544 = load i32, i32* %543, align 8, !tbaa !45
  %545 = icmp sgt i32 %544, 1
  br i1 %545, label %546, label %547

546:                                              ; preds = %533
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %420) #5
  store %struct.tre_ast_node_t* null, %struct.tre_ast_node_t** %6, align 8, !tbaa !47
  br label %553

547:                                              ; preds = %533
  %548 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %537, i64 0, i32 2
  %549 = load i32, i32* %548, align 4, !tbaa !46
  %550 = icmp sgt i32 %549, 1
  br i1 %550, label %551, label %649

551:                                              ; preds = %547
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %420) #5
  store %struct.tre_ast_node_t* null, %struct.tre_ast_node_t** %6, align 8, !tbaa !47
  %552 = icmp sgt i32 %544, 0
  br i1 %552, label %553, label %589

553:                                              ; preds = %551, %546
  %554 = phi i32 [ 2, %551 ], [ 1, %546 ]
  %555 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %537, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %421) #5
  %556 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %555, align 8, !tbaa !43
  %557 = call fastcc i32 @tre_copy_ast(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_stack_rec* noundef nonnull %12, %struct.tre_ast_node_t* noundef %556, i32 noundef %554, i32* noundef nonnull %4, i32* noundef %408, %struct.tre_ast_node_t** noundef nonnull %7, i32* noundef nonnull %5) #6
  %558 = icmp eq i32 %557, 0
  br i1 %558, label %572, label %570

559:                                              ; preds = %580
  %560 = load i32, i32* %543, align 8, !tbaa !45
  %561 = icmp slt i32 %573, %560
  br i1 %561, label %562, label %583

562:                                              ; preds = %559
  %563 = load i32, i32* %4, align 4, !tbaa !9
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %421) #5
  %564 = add nuw nsw i32 %573, 1
  %565 = icmp slt i32 %564, %560
  %566 = select i1 %565, i32 1, i32 2
  %567 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %555, align 8, !tbaa !43
  %568 = call fastcc i32 @tre_copy_ast(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_stack_rec* noundef nonnull %12, %struct.tre_ast_node_t* noundef %567, i32 noundef %566, i32* noundef nonnull %4, i32* noundef %408, %struct.tre_ast_node_t** noundef nonnull %7, i32* noundef nonnull %5) #6
  %569 = icmp eq i32 %568, 0
  br i1 %569, label %572, label %570

570:                                              ; preds = %553, %562
  %571 = phi i32 [ %568, %562 ], [ %557, %553 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %421) #5
  br label %656

572:                                              ; preds = %553, %562
  %573 = phi i32 [ %564, %562 ], [ 1, %553 ]
  %574 = phi %struct.tre_ast_node_t* [ %581, %562 ], [ null, %553 ]
  %575 = phi i32 [ %563, %562 ], [ %542, %553 ]
  %576 = icmp eq %struct.tre_ast_node_t* %574, null
  %577 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %7, align 8, !tbaa !47
  br i1 %576, label %580, label %578

578:                                              ; preds = %572
  %579 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_catenation(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_ast_node_t* noundef nonnull %574, %struct.tre_ast_node_t* noundef %577) #6
  br label %580

580:                                              ; preds = %578, %572
  %581 = phi %struct.tre_ast_node_t* [ %579, %578 ], [ %577, %572 ]
  %582 = icmp eq %struct.tre_ast_node_t* %581, null
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %421) #5
  br i1 %582, label %656, label %559

583:                                              ; preds = %559
  %584 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %537, i64 0, i32 2
  %585 = load i32, i32* %584, align 4, !tbaa !46
  %586 = icmp eq i32 %585, -1
  br i1 %586, label %596, label %587

587:                                              ; preds = %583
  %588 = icmp slt i32 %560, %585
  br i1 %588, label %591, label %641

589:                                              ; preds = %551
  %590 = icmp slt i32 %544, %549
  br i1 %590, label %591, label %656

591:                                              ; preds = %589, %587
  %592 = phi %struct.tre_ast_node_t* [ null, %589 ], [ %581, %587 ]
  %593 = phi i32 [ %544, %589 ], [ %560, %587 ]
  %594 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %537, i64 0, i32 2
  %595 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %537, i64 0, i32 0
  br label %609

596:                                              ; preds = %583
  %597 = load i32, i32* %4, align 4, !tbaa !9
  %598 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %537, i64 0, i32 0
  %599 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %598, align 8, !tbaa !43
  %600 = call fastcc i32 @tre_copy_ast(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_stack_rec* noundef nonnull %12, %struct.tre_ast_node_t* noundef %599, i32 noundef 0, i32* noundef nonnull %4, i32* noundef null, %struct.tre_ast_node_t** noundef nonnull %6, i32* noundef nonnull %5) #6
  %601 = icmp eq i32 %600, 0
  br i1 %601, label %602, label %656

602:                                              ; preds = %596
  %603 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %6, align 8, !tbaa !47
  %604 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_iter(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_ast_node_t* noundef %603, i32 noundef 0, i32 noundef -1, i32 noundef 0) #6
  %605 = icmp eq %struct.tre_ast_node_t* %604, null
  br i1 %605, label %656, label %635

606:                                              ; preds = %629
  %607 = load i32, i32* %594, align 4, !tbaa !46
  %608 = icmp slt i32 %632, %607
  br i1 %608, label %609, label %633

609:                                              ; preds = %606, %591
  %610 = phi i32 [ %593, %591 ], [ %632, %606 ]
  %611 = phi %struct.tre_ast_node_t* [ null, %591 ], [ %630, %606 ]
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %422) #5
  %612 = load i32, i32* %4, align 4, !tbaa !9
  %613 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %595, align 8, !tbaa !43
  %614 = call fastcc i32 @tre_copy_ast(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_stack_rec* noundef nonnull %12, %struct.tre_ast_node_t* noundef %613, i32 noundef 0, i32* noundef nonnull %4, i32* noundef null, %struct.tre_ast_node_t** noundef nonnull %8, i32* noundef nonnull %5) #6
  %615 = icmp eq i32 %614, 0
  br i1 %615, label %616, label %627

616:                                              ; preds = %609
  %617 = icmp eq %struct.tre_ast_node_t* %611, null
  %618 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %8, align 8, !tbaa !47
  br i1 %617, label %621, label %619

619:                                              ; preds = %616
  %620 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_catenation(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_ast_node_t* noundef %618, %struct.tre_ast_node_t* noundef nonnull %611) #6
  br label %621

621:                                              ; preds = %619, %616
  %622 = phi %struct.tre_ast_node_t* [ %620, %619 ], [ %618, %616 ]
  %623 = icmp eq %struct.tre_ast_node_t* %622, null
  br i1 %623, label %627, label %624

624:                                              ; preds = %621
  %625 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef nonnull %24, i32 noundef -1, i32 noundef -1, i32 noundef -1) #6
  %626 = icmp eq %struct.tre_ast_node_t* %625, null
  br i1 %626, label %627, label %629

627:                                              ; preds = %624, %621, %609
  %628 = phi i32 [ %614, %609 ], [ 12, %621 ], [ 12, %624 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %422) #5
  br label %656

629:                                              ; preds = %624
  %630 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_union(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_ast_node_t* noundef nonnull %625, %struct.tre_ast_node_t* noundef nonnull %622) #6
  %631 = icmp eq %struct.tre_ast_node_t* %630, null
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %422) #5
  %632 = add nsw i32 %610, 1
  br i1 %631, label %656, label %606

633:                                              ; preds = %606
  %634 = icmp eq %struct.tre_ast_node_t* %592, null
  br i1 %634, label %641, label %635

635:                                              ; preds = %602, %633
  %636 = phi i32 [ %612, %633 ], [ %597, %602 ]
  %637 = phi %struct.tre_ast_node_t* [ %630, %633 ], [ %604, %602 ]
  %638 = phi %struct.tre_ast_node_t* [ %592, %633 ], [ %581, %602 ]
  %639 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_catenation(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_ast_node_t* noundef nonnull %638, %struct.tre_ast_node_t* noundef nonnull %637) #6
  %640 = icmp eq %struct.tre_ast_node_t* %639, null
  br i1 %640, label %656, label %641

641:                                              ; preds = %633, %587, %635
  %642 = phi i32 [ %636, %635 ], [ %575, %587 ], [ %612, %633 ]
  %643 = phi %struct.tre_ast_node_t* [ %639, %635 ], [ %581, %587 ], [ %630, %633 ]
  %644 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %643, i64 0, i32 1
  %645 = load i8*, i8** %644, align 8, !tbaa !36
  store i8* %645, i8** %535, align 8, !tbaa !36
  %646 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %643, i64 0, i32 0
  %647 = load i32, i32* %646, align 8, !tbaa !35
  %648 = bitcast i8* %440 to i32*
  store i32 %647, i32* %648, align 8, !tbaa !35
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %420) #5
  br label %649

649:                                              ; preds = %641, %547
  %650 = phi i32 [ %642, %641 ], [ %542, %547 ]
  %651 = add nsw i32 %427, -1
  %652 = sub nsw i32 %650, %542
  %653 = add nsw i32 %652, %426
  %654 = icmp eq i32 %651, 0
  %655 = select i1 %654, i32 %653, i32 %650
  store i32 %655, i32* %4, align 4
  br label %658

656:                                              ; preds = %589, %635, %602, %596, %580, %629, %627, %570
  %657 = phi i32 [ %628, %627 ], [ %571, %570 ], [ 12, %629 ], [ 12, %580 ], [ 12, %589 ], [ %600, %596 ], [ 12, %602 ], [ 12, %635 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %420) #5
  br label %665

658:                                              ; preds = %649, %529, %496, %477, %453, %444, %441, %430
  %659 = phi i32 [ %424, %430 ], [ %424, %441 ], [ %424, %444 ], [ %424, %477 ], [ %424, %496 ], [ %530, %529 ], [ %424, %453 ], [ %655, %649 ]
  %660 = phi i32 [ %425, %430 ], [ %425, %441 ], [ %425, %444 ], [ %425, %477 ], [ %425, %496 ], [ %531, %529 ], [ %424, %453 ], [ %655, %649 ]
  %661 = phi i32 [ %427, %430 ], [ %427, %441 ], [ %427, %444 ], [ %427, %477 ], [ %427, %496 ], [ %532, %529 ], [ %427, %453 ], [ %651, %649 ]
  %662 = phi i32 [ %426, %430 ], [ %426, %441 ], [ %426, %444 ], [ %426, %477 ], [ %426, %496 ], [ %426, %529 ], [ %426, %453 ], [ %653, %649 ]
  %663 = phi i32 [ 0, %430 ], [ 0, %441 ], [ 0, %444 ], [ %478, %477 ], [ %497, %496 ], [ 0, %529 ], [ 0, %453 ], [ 0, %649 ]
  %664 = icmp eq i32 %663, 0
  br i1 %664, label %423, label %667

665:                                              ; preds = %416, %407, %656
  %666 = phi i32 [ %657, %656 ], [ %414, %407 ], [ %417, %416 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %412) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %411) #5
  br label %834

667:                                              ; preds = %423, %460, %469, %472, %479, %488, %491, %498, %506, %509, %512, %517, %658
  %668 = phi i32 [ %662, %658 ], [ %426, %423 ], [ %426, %472 ], [ %426, %469 ], [ %426, %460 ], [ %426, %491 ], [ %426, %488 ], [ %426, %479 ], [ %426, %498 ], [ %426, %506 ], [ %426, %509 ], [ %426, %512 ], [ %426, %517 ]
  %669 = phi i32 [ %663, %658 ], [ 0, %423 ], [ %475, %472 ], [ %470, %469 ], [ %467, %460 ], [ %494, %491 ], [ %489, %488 ], [ %486, %479 ], [ %504, %498 ], [ %507, %506 ], [ %510, %509 ], [ %515, %512 ], [ %518, %517 ]
  %670 = load i32, i32* %409, align 4, !tbaa !9
  %671 = add nsw i32 %670, %668
  %672 = load i32, i32* %5, align 4, !tbaa !9
  %673 = icmp sgt i32 %672, %671
  %674 = select i1 %673, i32 %672, i32 %671
  store i32 %674, i32* %409, align 4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %412) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %411) #5
  %675 = icmp eq i32 %669, 0
  br i1 %675, label %676, label %834

676:                                              ; preds = %667
  %677 = add nsw i32 %674, 1
  store i32 %677, i32* %409, align 4, !tbaa !48
  %678 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef nonnull %24, i32 noundef 0, i32 noundef 0, i32 noundef %674) #7
  %679 = icmp eq %struct.tre_ast_node_t* %678, null
  br i1 %679, label %834, label %680

680:                                              ; preds = %676
  %681 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_catenation(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_ast_node_t* noundef %308, %struct.tre_ast_node_t* noundef nonnull %678) #7
  %682 = icmp eq %struct.tre_ast_node_t* %681, null
  br i1 %682, label %834, label %683

683:                                              ; preds = %680
  %684 = call fastcc i32 @tre_compute_nfl(%struct.tre_mem_struct* noundef nonnull %24, %struct.tre_stack_rec* noundef nonnull %12, %struct.tre_ast_node_t* noundef nonnull %681) #7
  %685 = icmp eq i32 %684, 0
  br i1 %685, label %686, label %834

686:                                              ; preds = %683
  %687 = load i32, i32* %409, align 4, !tbaa !48
  %688 = sext i32 %687 to i64
  %689 = shl nsw i64 %688, 2
  %690 = call i8* @malloc(i64 noundef %689) #6
  %691 = bitcast i8* %690 to i32*
  %692 = icmp eq i8* %690, null
  br i1 %692, label %834, label %693

693:                                              ; preds = %686
  %694 = load i32, i32* %409, align 4, !tbaa !48
  %695 = sext i32 %694 to i64
  %696 = shl nsw i64 %695, 2
  %697 = call i8* @malloc(i64 noundef %696) #6
  %698 = bitcast i8* %697 to i32*
  %699 = icmp eq i8* %697, null
  br i1 %699, label %834, label %700

700:                                              ; preds = %693
  %701 = load i32, i32* %409, align 4, !tbaa !48
  %702 = icmp sgt i32 %701, 0
  br i1 %702, label %703, label %710

703:                                              ; preds = %700, %703
  %704 = phi i64 [ %706, %703 ], [ 0, %700 ]
  %705 = getelementptr inbounds i32, i32* %691, i64 %704
  store i32 0, i32* %705, align 4, !tbaa !9
  %706 = add nuw nsw i64 %704, 1
  %707 = load i32, i32* %409, align 4, !tbaa !48
  %708 = sext i32 %707 to i64
  %709 = icmp slt i64 %706, %708
  br i1 %709, label %703, label %710

710:                                              ; preds = %703, %700
  %711 = call fastcc i32 @tre_ast_to_tnfa(%struct.tre_ast_node_t* noundef nonnull %681, %struct.tnfa_transition* noundef null, i32* noundef nonnull %691, i32* noundef null) #7
  %712 = load i32, i32* %409, align 4, !tbaa !48
  %713 = icmp sgt i32 %712, 0
  br i1 %713, label %714, label %726

714:                                              ; preds = %710, %714
  %715 = phi i64 [ %722, %714 ], [ 0, %710 ]
  %716 = phi i32 [ %721, %714 ], [ 0, %710 ]
  %717 = getelementptr inbounds i32, i32* %698, i64 %715
  store i32 %716, i32* %717, align 4, !tbaa !9
  %718 = getelementptr inbounds i32, i32* %691, i64 %715
  %719 = load i32, i32* %718, align 4, !tbaa !9
  %720 = add i32 %716, 1
  %721 = add i32 %720, %719
  store i32 0, i32* %718, align 4, !tbaa !9
  %722 = add nuw nsw i64 %715, 1
  %723 = load i32, i32* %409, align 4, !tbaa !48
  %724 = sext i32 %723 to i64
  %725 = icmp slt i64 %722, %724
  br i1 %725, label %714, label %726

726:                                              ; preds = %714, %710
  %727 = phi i32 [ 0, %710 ], [ %721, %714 ]
  %728 = add i32 %727, 1
  %729 = zext i32 %728 to i64
  %730 = call i8* @calloc(i64 noundef %729, i64 noundef 56) #6
  %731 = bitcast i8* %730 to %struct.tnfa_transition*
  %732 = icmp eq i8* %730, null
  br i1 %732, label %834, label %733

733:                                              ; preds = %726
  %734 = bitcast i8* %345 to i8**
  store i8* %730, i8** %734, align 8, !tbaa !49
  %735 = getelementptr inbounds i8, i8* %345, i64 8
  %736 = bitcast i8* %735 to i32*
  store i32 %727, i32* %736, align 8, !tbaa !50
  %737 = call fastcc i32 @tre_ast_to_tnfa(%struct.tre_ast_node_t* noundef nonnull %681, %struct.tnfa_transition* noundef nonnull %731, i32* noundef nonnull %691, i32* noundef nonnull %698) #7
  %738 = icmp eq i32 %737, 0
  br i1 %738, label %739, label %834

739:                                              ; preds = %733
  %740 = getelementptr inbounds i8, i8* %345, i64 40
  %741 = bitcast i8* %740 to i8**
  store i8* null, i8** %741, align 8, !tbaa !51
  %742 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %681, i64 0, i32 6
  %743 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %742, align 8, !tbaa !52
  %744 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %743, i64 0, i32 0
  %745 = load i32, i32* %744, align 8, !tbaa !53
  %746 = icmp sgt i32 %745, -1
  br i1 %746, label %747, label %758

747:                                              ; preds = %739, %747
  %748 = phi %struct.tre_pos_and_tags_t* [ %751, %747 ], [ %743, %739 ]
  %749 = phi i32 [ %750, %747 ], [ 0, %739 ]
  %750 = add nuw nsw i32 %749, 1
  %751 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %748, i64 1
  %752 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %751, i64 0, i32 0
  %753 = load i32, i32* %752, align 8, !tbaa !53
  %754 = icmp sgt i32 %753, -1
  br i1 %754, label %747, label %755

755:                                              ; preds = %747
  %756 = add nuw i32 %749, 2
  %757 = zext i32 %756 to i64
  br label %758

758:                                              ; preds = %755, %739
  %759 = phi i64 [ 1, %739 ], [ %757, %755 ]
  %760 = call i8* @calloc(i64 noundef %759, i64 noundef 56) #6
  %761 = bitcast i8* %760 to %struct.tnfa_transition*
  %762 = icmp eq i8* %760, null
  br i1 %762, label %834, label %763

763:                                              ; preds = %758
  %764 = getelementptr inbounds i8, i8* %345, i64 16
  %765 = bitcast i8* %764 to i8**
  store i8* %760, i8** %765, align 8, !tbaa !55
  %766 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %742, align 8, !tbaa !52
  %767 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %766, i64 0, i32 0
  %768 = load i32, i32* %767, align 8, !tbaa !53
  %769 = icmp sgt i32 %768, -1
  br i1 %769, label %770, label %813

770:                                              ; preds = %763, %802
  %771 = phi i64 [ %806, %802 ], [ 0, %763 ]
  %772 = phi i32 [ %809, %802 ], [ %768, %763 ]
  %773 = phi %struct.tre_pos_and_tags_t* [ %807, %802 ], [ %766, %763 ]
  %774 = zext i32 %772 to i64
  %775 = getelementptr inbounds i32, i32* %698, i64 %774
  %776 = load i32, i32* %775, align 4, !tbaa !9
  %777 = sext i32 %776 to i64
  %778 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %731, i64 %777
  %779 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %761, i64 %771, i32 2
  store %struct.tnfa_transition* %778, %struct.tnfa_transition** %779, align 8, !tbaa !56
  %780 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %761, i64 %771, i32 3
  store i32 %772, i32* %780, align 8, !tbaa !58
  %781 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %761, i64 %771, i32 4
  store i32* null, i32** %781, align 8, !tbaa !59
  %782 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %773, i64 0, i32 3
  %783 = load i32*, i32** %782, align 8, !tbaa !60
  %784 = icmp eq i32* %783, null
  br i1 %784, label %802, label %785

785:                                              ; preds = %770, %785
  %786 = phi i64 [ %790, %785 ], [ 0, %770 ]
  %787 = getelementptr inbounds i32, i32* %783, i64 %786
  %788 = load i32, i32* %787, align 4, !tbaa !9
  %789 = icmp sgt i32 %788, -1
  %790 = add nuw i64 %786, 1
  br i1 %789, label %785, label %791

791:                                              ; preds = %785
  %792 = shl i64 %786, 2
  %793 = add i64 %792, 4
  %794 = and i64 %793, 17179869180
  %795 = call i8* @malloc(i64 noundef %794) #6
  %796 = bitcast i32** %781 to i8**
  store i8* %795, i8** %796, align 8, !tbaa !59
  %797 = icmp eq i8* %795, null
  br i1 %797, label %834, label %798

798:                                              ; preds = %791
  %799 = bitcast i32** %782 to i8**
  %800 = load i8*, i8** %799, align 8, !tbaa !60
  %801 = call i8* @memcpy(i8* noundef nonnull %795, i8* noundef %800, i64 noundef %794) #6
  br label %802

802:                                              ; preds = %798, %770
  %803 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %773, i64 0, i32 4
  %804 = load i32, i32* %803, align 8, !tbaa !61
  %805 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %761, i64 %771, i32 5
  store i32 %804, i32* %805, align 8, !tbaa !62
  %806 = add nuw i64 %771, 1
  %807 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %773, i64 1
  %808 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %807, i64 0, i32 0
  %809 = load i32, i32* %808, align 8, !tbaa !53
  %810 = icmp sgt i32 %809, -1
  br i1 %810, label %770, label %811

811:                                              ; preds = %802
  %812 = and i64 %806, 4294967295
  br label %813

813:                                              ; preds = %811, %763
  %814 = phi i64 [ 0, %763 ], [ %812, %811 ]
  %815 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %761, i64 %814, i32 2
  store %struct.tnfa_transition* null, %struct.tnfa_transition** %815, align 8, !tbaa !56
  store i32 %727, i32* %736, align 8, !tbaa !50
  %816 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %681, i64 0, i32 7
  %817 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %816, align 8, !tbaa !63
  %818 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %817, i64 0, i32 0
  %819 = load i32, i32* %818, align 8, !tbaa !53
  %820 = sext i32 %819 to i64
  %821 = getelementptr inbounds i32, i32* %698, i64 %820
  %822 = load i32, i32* %821, align 4, !tbaa !9
  %823 = sext i32 %822 to i64
  %824 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %731, i64 %823
  %825 = getelementptr inbounds i8, i8* %345, i64 24
  %826 = bitcast i8* %825 to %struct.tnfa_transition**
  store %struct.tnfa_transition* %824, %struct.tnfa_transition** %826, align 8, !tbaa !64
  %827 = load i32, i32* %409, align 4, !tbaa !48
  %828 = getelementptr inbounds i8, i8* %345, i64 84
  %829 = bitcast i8* %828 to i32*
  store i32 %827, i32* %829, align 4, !tbaa !65
  %830 = getelementptr inbounds i8, i8* %345, i64 88
  %831 = bitcast i8* %830 to i32*
  store i32 %2, i32* %831, align 8, !tbaa !66
  call void @__tre_mem_destroy(%struct.tre_mem_struct* noundef nonnull %24) #6
  %832 = load i8*, i8** %17, align 8, !tbaa !3
  call void @free(i8* noundef %832) #6
  call void @free(i8* noundef nonnull %11) #6
  call void @free(i8* noundef nonnull %690) #6
  call void @free(i8* noundef nonnull %697) #6
  %833 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %0, i64 0, i32 1
  store i8* %345, i8** %833, align 8, !tbaa !67
  br label %850

834:                                              ; preds = %89, %85, %68, %64, %60, %315, %264, %294, %298, %177, %196, %191, %219, %791, %28, %665, %758, %733, %726, %693, %686, %683, %680, %676, %667, %402, %397, %387, %371, %363, %344, %337
  %835 = phi i32* [ null, %337 ], [ null, %344 ], [ null, %363 ], [ null, %371 ], [ null, %387 ], [ null, %397 ], [ null, %402 ], [ null, %667 ], [ null, %676 ], [ null, %680 ], [ null, %683 ], [ null, %686 ], [ null, %693 ], [ %698, %726 ], [ %698, %733 ], [ %698, %758 ], [ null, %665 ], [ null, %28 ], [ %698, %791 ], [ null, %219 ], [ null, %191 ], [ null, %196 ], [ null, %177 ], [ null, %298 ], [ null, %294 ], [ null, %264 ], [ null, %315 ], [ null, %60 ], [ null, %64 ], [ null, %68 ], [ null, %85 ], [ null, %89 ]
  %836 = phi i32* [ null, %337 ], [ null, %344 ], [ null, %363 ], [ null, %371 ], [ null, %387 ], [ null, %397 ], [ null, %402 ], [ null, %667 ], [ null, %676 ], [ null, %680 ], [ null, %683 ], [ null, %686 ], [ %691, %693 ], [ %691, %726 ], [ %691, %733 ], [ %691, %758 ], [ null, %665 ], [ null, %28 ], [ %691, %791 ], [ null, %219 ], [ null, %191 ], [ null, %196 ], [ null, %177 ], [ null, %298 ], [ null, %294 ], [ null, %264 ], [ null, %315 ], [ null, %60 ], [ null, %64 ], [ null, %68 ], [ null, %85 ], [ null, %89 ]
  %837 = phi %struct.tnfa* [ null, %337 ], [ null, %344 ], [ %346, %363 ], [ %346, %371 ], [ %346, %387 ], [ %346, %397 ], [ %346, %402 ], [ %346, %667 ], [ %346, %676 ], [ %346, %680 ], [ %346, %683 ], [ %346, %686 ], [ %346, %693 ], [ %346, %726 ], [ %346, %733 ], [ %346, %758 ], [ %346, %665 ], [ null, %28 ], [ %346, %791 ], [ null, %219 ], [ null, %191 ], [ null, %196 ], [ null, %177 ], [ null, %298 ], [ null, %294 ], [ null, %264 ], [ null, %315 ], [ null, %60 ], [ null, %64 ], [ null, %68 ], [ null, %85 ], [ null, %89 ]
  %838 = phi i32 [ 6, %337 ], [ 12, %344 ], [ %364, %363 ], [ 12, %371 ], [ 12, %387 ], [ 12, %397 ], [ %405, %402 ], [ %669, %667 ], [ 12, %676 ], [ 12, %680 ], [ %684, %683 ], [ 12, %686 ], [ 12, %693 ], [ 12, %726 ], [ %737, %733 ], [ 12, %758 ], [ %666, %665 ], [ %37, %28 ], [ 12, %791 ], [ 10, %177 ], [ 10, %196 ], [ 10, %191 ], [ 12, %219 ], [ 8, %315 ], [ 8, %264 ], [ 12, %294 ], [ 12, %298 ], [ 12, %85 ], [ %90, %89 ], [ %62, %60 ], [ %66, %64 ], [ %71, %68 ]
  call void @__tre_mem_destroy(%struct.tre_mem_struct* noundef nonnull %24) #6
  %839 = load i8*, i8** %17, align 8, !tbaa !3
  call void @free(i8* noundef %839) #6
  call void @free(i8* noundef nonnull %11) #6
  %840 = icmp eq i32* %836, null
  br i1 %840, label %843, label %841

841:                                              ; preds = %834
  %842 = bitcast i32* %836 to i8*
  call void @free(i8* noundef nonnull %842) #6
  br label %843

843:                                              ; preds = %841, %834
  %844 = icmp eq i32* %835, null
  br i1 %844, label %847, label %845

845:                                              ; preds = %843
  %846 = bitcast i32* %835 to i8*
  call void @free(i8* noundef nonnull %846) #6
  br label %847

847:                                              ; preds = %845, %843
  %848 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %0, i64 0, i32 1
  %849 = bitcast i8** %848 to %struct.tnfa**
  store %struct.tnfa* %837, %struct.tnfa** %849, align 8, !tbaa !67
  call void @regfree(%struct.re_pattern_buffer* noundef %0) #7
  br label %850

850:                                              ; preds = %3, %19, %847, %813, %26
  %851 = phi i32 [ %838, %847 ], [ 0, %813 ], [ 12, %26 ], [ 12, %19 ], [ 12, %3 ]
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %10) #5
  ret i32 %851
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden %struct.tre_mem_struct* @__tre_mem_new_impl(i32 noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @tre_add_tags(%struct.tre_mem_struct* noundef %0, %struct.tre_stack_rec* noundef %1, %struct.tre_ast_node_t* noundef %2, %struct.tnfa* noundef %3) unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %1, i64 0, i32 3
  %6 = load i32, i32* %5, align 4, !tbaa !19
  %7 = icmp eq %struct.tre_mem_struct* %0, null
  %8 = icmp eq %struct.tnfa* %3, null
  %9 = or i1 %7, %8
  br i1 %9, label %14, label %10

10:                                               ; preds = %4
  %11 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 12
  store i32 0, i32* %11, align 8, !tbaa !68
  %12 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 9
  %13 = load i32*, i32** %12, align 8, !tbaa !33
  store i32 -1, i32* %13, align 4, !tbaa !9
  br label %14

14:                                               ; preds = %10, %4
  %15 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 7
  %16 = load i32, i32* %15, align 4, !tbaa !30
  %17 = shl i32 %16, 1
  %18 = add i32 %17, 2
  %19 = zext i32 %18 to i64
  %20 = shl nuw nsw i64 %19, 2
  %21 = tail call i8* @malloc(i64 noundef %20) #6
  %22 = bitcast i8* %21 to i32*
  %23 = icmp eq i8* %21, null
  br i1 %23, label %803, label %24

24:                                               ; preds = %14
  store i32 -1, i32* %22, align 4, !tbaa !9
  %25 = load i32, i32* %15, align 4, !tbaa !30
  %26 = add i32 %25, 1
  %27 = zext i32 %26 to i64
  %28 = shl nuw nsw i64 %27, 2
  %29 = tail call i8* @malloc(i64 noundef %28) #6
  %30 = bitcast i8* %29 to i32*
  %31 = icmp eq i8* %29, null
  br i1 %31, label %800, label %32

32:                                               ; preds = %24
  store i32 -1, i32* %30, align 4, !tbaa !9
  %33 = load i32, i32* %15, align 4, !tbaa !30
  %34 = add i32 %33, 1
  %35 = zext i32 %34 to i64
  %36 = shl nuw nsw i64 %35, 3
  %37 = tail call i8* @malloc(i64 noundef %36) #6
  %38 = bitcast i8* %37 to %struct.tre_tag_states_t*
  %39 = icmp eq i8* %37, null
  br i1 %39, label %796, label %40

40:                                               ; preds = %32
  %41 = load i32, i32* %15, align 4, !tbaa !30
  br label %42

42:                                               ; preds = %40, %42
  %43 = phi i32 [ 0, %40 ], [ %46, %42 ]
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds %struct.tre_tag_states_t, %struct.tre_tag_states_t* %38, i64 %44, i32 0
  store i32 -1, i32* %45, align 4, !tbaa !69
  %46 = add i32 %43, 1
  %47 = icmp ugt i32 %46, %41
  br i1 %47, label %48, label %42

48:                                               ; preds = %42
  %49 = bitcast %struct.tre_ast_node_t* %2 to i8*
  %50 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %49) #6
  %51 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* null) #6
  %52 = load i32, i32* %5, align 4, !tbaa !19
  %53 = icmp sle i32 %52, %6
  %54 = icmp ne i32 %51, 0
  %55 = select i1 %53, i1 true, i1 %54
  br i1 %55, label %741, label %56

56:                                               ; preds = %48
  %57 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %1, i64 0, i32 4
  %58 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 8
  %59 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 4
  %60 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 9
  br label %61

61:                                               ; preds = %56, %728
  %62 = phi i32 [ %52, %56 ], [ %737, %728 ]
  %63 = phi i32* [ %22, %56 ], [ %735, %728 ]
  %64 = phi i32 [ 0, %56 ], [ %734, %728 ]
  %65 = phi i32 [ 0, %56 ], [ %733, %728 ]
  %66 = phi i32 [ 0, %56 ], [ %732, %728 ]
  %67 = phi i32 [ 1, %56 ], [ %731, %728 ]
  %68 = phi i32 [ -1, %56 ], [ %730, %728 ]
  %69 = phi i32 [ 0, %56 ], [ %729, %728 ]
  %70 = load %union.tre_stack_item*, %union.tre_stack_item** %57, align 8, !tbaa !3
  %71 = add nsw i32 %62, -1
  store i32 %71, i32* %5, align 4, !tbaa !19
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %72
  %74 = bitcast %union.tre_stack_item* %73 to i32*
  %75 = load i32, i32* %74, align 8, !tbaa !16
  switch i32 %75, label %728 [
    i32 6, label %76
    i32 0, label %107
    i32 1, label %570
    i32 4, label %609
    i32 5, label %622
    i32 2, label %642
    i32 3, label %647
  ]

76:                                               ; preds = %61
  %77 = add nsw i32 %62, -2
  store i32 %77, i32* %5, align 4, !tbaa !19
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %78
  %80 = bitcast %union.tre_stack_item* %79 to i32*
  %81 = load i32, i32* %80, align 8, !tbaa !16
  br label %82

82:                                               ; preds = %82, %76
  %83 = phi i64 [ %87, %82 ], [ 0, %76 ]
  %84 = getelementptr inbounds i32, i32* %63, i64 %83
  %85 = load i32, i32* %84, align 4, !tbaa !9
  %86 = icmp sgt i32 %85, -1
  %87 = add nuw i64 %83, 1
  br i1 %86, label %82, label %88

88:                                               ; preds = %82
  %89 = and i64 %83, 4294967295
  %90 = getelementptr inbounds i32, i32* %63, i64 %89
  %91 = shl nsw i32 %81, 1
  %92 = or i32 %91, 1
  store i32 %92, i32* %90, align 4, !tbaa !9
  %93 = add i64 %83, 1
  %94 = and i64 %93, 4294967295
  %95 = getelementptr inbounds i32, i32* %63, i64 %94
  store i32 -1, i32* %95, align 4, !tbaa !9
  br label %96

96:                                               ; preds = %96, %88
  %97 = phi i64 [ %101, %96 ], [ 0, %88 ]
  %98 = getelementptr inbounds i32, i32* %30, i64 %97
  %99 = load i32, i32* %98, align 4, !tbaa !9
  %100 = icmp sgt i32 %99, -1
  %101 = add nuw i64 %97, 1
  br i1 %100, label %96, label %102

102:                                              ; preds = %96
  %103 = shl i64 %97, 32
  %104 = add i64 %103, -4294967296
  %105 = ashr exact i64 %104, 32
  %106 = getelementptr inbounds i32, i32* %30, i64 %105
  store i32 -1, i32* %106, align 4, !tbaa !9
  br label %728

107:                                              ; preds = %61
  %108 = add nsw i32 %62, -2
  store i32 %108, i32* %5, align 4, !tbaa !19
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %109, i32 0
  %111 = load i8*, i8** %110, align 8, !tbaa !16
  %112 = bitcast i8* %111 to %struct.tre_ast_node_t*
  %113 = getelementptr inbounds i8, i8* %111, i64 20
  %114 = bitcast i8* %113 to i32*
  %115 = load i32, i32* %114, align 4, !tbaa !20
  %116 = icmp sgt i32 %115, -1
  br i1 %116, label %117, label %176

117:                                              ; preds = %107, %117
  %118 = phi i64 [ %122, %117 ], [ 0, %107 ]
  %119 = getelementptr inbounds i32, i32* %63, i64 %118
  %120 = load i32, i32* %119, align 4, !tbaa !9
  %121 = icmp sgt i32 %120, -1
  %122 = add nuw i64 %118, 1
  br i1 %121, label %117, label %123

123:                                              ; preds = %117
  %124 = and i64 %118, 4294967295
  %125 = getelementptr inbounds i32, i32* %63, i64 %124
  %126 = shl nsw i32 %115, 1
  store i32 %126, i32* %125, align 4, !tbaa !9
  %127 = add i64 %118, 1
  %128 = and i64 %127, 4294967295
  %129 = getelementptr inbounds i32, i32* %63, i64 %128
  store i32 -1, i32* %129, align 4, !tbaa !9
  br i1 %9, label %167, label %130

130:                                              ; preds = %123, %130
  %131 = phi i64 [ %135, %130 ], [ 0, %123 ]
  %132 = getelementptr inbounds i32, i32* %30, i64 %131
  %133 = load i32, i32* %132, align 4, !tbaa !9
  %134 = icmp sgt i32 %133, -1
  %135 = add nuw i64 %131, 1
  br i1 %134, label %130, label %136

136:                                              ; preds = %130
  %137 = trunc i64 %131 to i32
  %138 = load %struct.tre_submatch_data*, %struct.tre_submatch_data** %59, align 8, !tbaa !34
  %139 = sext i32 %115 to i64
  %140 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %138, i64 %139, i32 2
  store i32* null, i32** %140, align 8, !tbaa !71
  %141 = icmp eq i32 %137, 0
  br i1 %141, label %167, label %142

142:                                              ; preds = %136
  %143 = shl i64 %131, 2
  %144 = add i64 %143, 4
  %145 = and i64 %144, 17179869180
  %146 = tail call i8* @malloc(i64 noundef %145) #6
  %147 = bitcast i8* %146 to i32*
  %148 = icmp eq i8* %146, null
  br i1 %148, label %741, label %149

149:                                              ; preds = %142
  %150 = load %struct.tre_submatch_data*, %struct.tre_submatch_data** %59, align 8, !tbaa !34
  %151 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %150, i64 %139, i32 2
  %152 = bitcast i32** %151 to i8**
  store i8* %146, i8** %152, align 8, !tbaa !71
  %153 = load i32, i32* %30, align 4, !tbaa !9
  %154 = icmp sgt i32 %153, -1
  br i1 %154, label %155, label %163

155:                                              ; preds = %149, %155
  %156 = phi i64 [ %159, %155 ], [ 0, %149 ]
  %157 = phi i32 [ %161, %155 ], [ %153, %149 ]
  %158 = getelementptr inbounds i32, i32* %147, i64 %156
  store i32 %157, i32* %158, align 4, !tbaa !9
  %159 = add nuw nsw i64 %156, 1
  %160 = getelementptr inbounds i32, i32* %30, i64 %159
  %161 = load i32, i32* %160, align 4, !tbaa !9
  %162 = icmp sgt i32 %161, -1
  br i1 %162, label %155, label %163

163:                                              ; preds = %155, %149
  %164 = phi i64 [ 0, %149 ], [ %159, %155 ]
  %165 = and i64 %164, 4294967295
  %166 = getelementptr inbounds i32, i32* %147, i64 %165
  store i32 -1, i32* %166, align 4, !tbaa !9
  br label %167

167:                                              ; preds = %163, %136, %123
  %168 = load i32, i32* %114, align 4, !tbaa !20
  %169 = zext i32 %168 to i64
  %170 = inttoptr i64 %169 to i8*
  %171 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %170) #6
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %173, label %741

173:                                              ; preds = %167
  %174 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* nonnull inttoptr (i64 6 to i8*)) #6
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %176, label %741

176:                                              ; preds = %173, %107
  %177 = bitcast i8* %111 to i32*
  %178 = load i32, i32* %177, align 8, !tbaa !35
  switch i32 %178, label %548 [
    i32 0, label %179
    i32 1, label %248
    i32 2, label %302
    i32 3, label %414
  ]

179:                                              ; preds = %176
  %180 = getelementptr inbounds i8, i8* %111, i64 8
  %181 = bitcast i8* %180 to %struct.tre_literal_t**
  %182 = load %struct.tre_literal_t*, %struct.tre_literal_t** %181, align 8, !tbaa !36
  %183 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %182, i64 0, i32 0
  %184 = load i64, i64* %183, align 8, !tbaa !37
  %185 = icmp sgt i64 %184, -1
  %186 = icmp eq i64 %184, -4
  %187 = or i1 %185, %186
  br i1 %187, label %188, label %548

188:                                              ; preds = %179
  %189 = load i32, i32* %63, align 4, !tbaa !9
  %190 = icmp sgt i32 %189, -1
  br i1 %190, label %191, label %548

191:                                              ; preds = %188
  br i1 %9, label %239, label %192

192:                                              ; preds = %191
  %193 = tail call fastcc i32 @tre_add_tag_left(%struct.tre_mem_struct* noundef nonnull %0, %struct.tre_ast_node_t* noundef nonnull %112, i32 noundef %66) #7
  %194 = load i32*, i32** %58, align 8, !tbaa !32
  %195 = sext i32 %66 to i64
  %196 = getelementptr inbounds i32, i32* %194, i64 %195
  store i32 %69, i32* %196, align 4, !tbaa !16
  %197 = icmp sgt i32 %68, -1
  br i1 %197, label %198, label %216

198:                                              ; preds = %192
  %199 = load i32*, i32** %60, align 8, !tbaa !33
  br label %200

200:                                              ; preds = %200, %198
  %201 = phi i64 [ %205, %200 ], [ 0, %198 ]
  %202 = getelementptr inbounds i32, i32* %199, i64 %201
  %203 = load i32, i32* %202, align 4, !tbaa !9
  %204 = icmp sgt i32 %203, -1
  %205 = add nuw i64 %201, 1
  br i1 %204, label %200, label %206

206:                                              ; preds = %200
  %207 = and i64 %201, 4294967295
  %208 = getelementptr inbounds i32, i32* %199, i64 %207
  store i32 %66, i32* %208, align 4, !tbaa !9
  %209 = add i64 %201, 1
  %210 = and i64 %209, 4294967295
  %211 = getelementptr inbounds i32, i32* %199, i64 %210
  store i32 %68, i32* %211, align 4, !tbaa !9
  %212 = add i64 %201, 2
  %213 = and i64 %212, 4294967295
  %214 = getelementptr inbounds i32, i32* %199, i64 %213
  store i32 -1, i32* %214, align 4, !tbaa !9
  %215 = add nsw i32 %65, 1
  br label %216

216:                                              ; preds = %206, %192
  %217 = phi i32 [ -1, %206 ], [ %68, %192 ]
  %218 = phi i32 [ %215, %206 ], [ %65, %192 ]
  %219 = load i32, i32* %63, align 4, !tbaa !9
  %220 = icmp sgt i32 %219, -1
  br i1 %220, label %221, label %242

221:                                              ; preds = %216
  %222 = load %struct.tre_submatch_data*, %struct.tre_submatch_data** %59, align 8, !tbaa !34
  br label %223

223:                                              ; preds = %234, %221
  %224 = phi i64 [ 0, %221 ], [ %235, %234 ]
  %225 = phi i32 [ %219, %221 ], [ %237, %234 ]
  %226 = lshr i32 %225, 1
  %227 = and i32 %225, 1
  %228 = icmp eq i32 %227, 0
  %229 = zext i32 %226 to i64
  br i1 %228, label %230, label %232

230:                                              ; preds = %223
  %231 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %222, i64 %229, i32 0
  store i32 %66, i32* %231, align 8, !tbaa !73
  br label %234

232:                                              ; preds = %223
  %233 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %222, i64 %229, i32 1
  store i32 %66, i32* %233, align 4, !tbaa !74
  br label %234

234:                                              ; preds = %232, %230
  %235 = add nuw i64 %224, 1
  %236 = getelementptr inbounds i32, i32* %63, i64 %235
  %237 = load i32, i32* %236, align 4, !tbaa !9
  %238 = icmp sgt i32 %237, -1
  br i1 %238, label %223, label %242

239:                                              ; preds = %191
  %240 = getelementptr inbounds i8, i8* %111, i64 28
  %241 = bitcast i8* %240 to i32*
  store i32 1, i32* %241, align 4, !tbaa !75
  br label %242

242:                                              ; preds = %234, %216, %239
  %243 = phi i32 [ %68, %239 ], [ %217, %216 ], [ %217, %234 ]
  %244 = phi i32 [ %65, %239 ], [ %218, %216 ], [ %218, %234 ]
  %245 = phi i32 [ 0, %239 ], [ %193, %216 ], [ %193, %234 ]
  store i32 -1, i32* %63, align 4, !tbaa !9
  %246 = add nsw i32 %64, 1
  %247 = add nsw i32 %67, 1
  br label %548

248:                                              ; preds = %176
  %249 = getelementptr inbounds i8, i8* %111, i64 8
  %250 = bitcast i8* %249 to %struct.tre_catenation_t**
  %251 = load %struct.tre_catenation_t*, %struct.tre_catenation_t** %250, align 8, !tbaa !36
  %252 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %251, i64 0, i32 0
  %253 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %252, align 8, !tbaa !42
  %254 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %251, i64 0, i32 1
  %255 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %254, align 8, !tbaa !40
  %256 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* nonnull %111) #6
  %257 = icmp eq i32 %256, 0
  br i1 %257, label %258, label %548

258:                                              ; preds = %248
  %259 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* nonnull inttoptr (i64 5 to i8*)) #6
  %260 = icmp eq i32 %259, 0
  br i1 %260, label %261, label %548

261:                                              ; preds = %258
  %262 = bitcast %struct.tre_ast_node_t* %255 to i8*
  %263 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %262) #6
  %264 = icmp eq i32 %263, 0
  br i1 %264, label %265, label %548

265:                                              ; preds = %261
  %266 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* null) #6
  %267 = icmp eq i32 %266, 0
  br i1 %267, label %268, label %548

268:                                              ; preds = %265
  %269 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %253, i64 0, i32 5
  %270 = load i32, i32* %269, align 4, !tbaa !75
  %271 = add nsw i32 %270, %67
  %272 = zext i32 %271 to i64
  %273 = inttoptr i64 %272 to i8*
  %274 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %273) #6
  %275 = icmp eq i32 %274, 0
  br i1 %275, label %276, label %548

276:                                              ; preds = %268
  %277 = load i32, i32* %269, align 4, !tbaa !75
  %278 = icmp sgt i32 %277, 0
  br i1 %278, label %279, label %286

279:                                              ; preds = %276
  %280 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %255, i64 0, i32 5
  %281 = load i32, i32* %280, align 4, !tbaa !75
  %282 = icmp sgt i32 %281, 0
  %283 = select i1 %282, i32 %67, i32 -1
  %284 = zext i1 %282 to i32
  %285 = add nsw i32 %67, %284
  br label %286

286:                                              ; preds = %279, %276
  %287 = phi i32 [ -1, %276 ], [ %283, %279 ]
  %288 = phi i32 [ %67, %276 ], [ %285, %279 ]
  %289 = zext i32 %287 to i64
  %290 = inttoptr i64 %289 to i8*
  %291 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %290) #6
  %292 = icmp eq i32 %291, 0
  br i1 %292, label %293, label %548

293:                                              ; preds = %286
  %294 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* nonnull inttoptr (i64 4 to i8*)) #6
  %295 = icmp eq i32 %294, 0
  br i1 %295, label %296, label %548

296:                                              ; preds = %293
  %297 = bitcast %struct.tre_ast_node_t* %253 to i8*
  %298 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %297) #6
  %299 = icmp eq i32 %298, 0
  br i1 %299, label %300, label %548

300:                                              ; preds = %296
  %301 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* null) #6
  br label %548

302:                                              ; preds = %176
  %303 = getelementptr inbounds i8, i8* %111, i64 8
  %304 = bitcast i8* %303 to %struct.tre_iteration_t**
  %305 = load %struct.tre_iteration_t*, %struct.tre_iteration_t** %304, align 8, !tbaa !36
  br i1 %9, label %306, label %320

306:                                              ; preds = %302
  %307 = load i32, i32* %63, align 4, !tbaa !9
  %308 = icmp sgt i32 %307, -1
  br i1 %308, label %314, label %309

309:                                              ; preds = %306
  %310 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %305, i64 0, i32 3
  %311 = load i8, i8* %310, align 8
  %312 = and i8 %311, 1
  %313 = icmp ne i8 %312, 0
  br label %314

314:                                              ; preds = %309, %306
  %315 = phi i1 [ true, %306 ], [ %313, %309 ]
  %316 = zext i1 %315 to i64
  %317 = inttoptr i64 %316 to i8*
  %318 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %317) #6
  %319 = icmp eq i32 %318, 0
  br i1 %319, label %333, label %548

320:                                              ; preds = %302
  %321 = zext i32 %66 to i64
  %322 = inttoptr i64 %321 to i8*
  %323 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %322) #6
  %324 = icmp eq i32 %323, 0
  br i1 %324, label %325, label %548

325:                                              ; preds = %320
  %326 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %305, i64 0, i32 3
  %327 = load i8, i8* %326, align 8
  %328 = and i8 %327, 1
  %329 = zext i8 %328 to i64
  %330 = inttoptr i64 %329 to i8*
  %331 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %330) #6
  %332 = icmp eq i32 %331, 0
  br i1 %332, label %333, label %548

333:                                              ; preds = %325, %314
  %334 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* nonnull %111) #6
  %335 = icmp eq i32 %334, 0
  br i1 %335, label %336, label %548

336:                                              ; preds = %333
  %337 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* nonnull inttoptr (i64 1 to i8*)) #6
  %338 = icmp eq i32 %337, 0
  br i1 %338, label %339, label %548

339:                                              ; preds = %336
  %340 = bitcast %struct.tre_iteration_t* %305 to i8**
  %341 = load i8*, i8** %340, align 8, !tbaa !43
  %342 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %341) #6
  %343 = icmp eq i32 %342, 0
  br i1 %343, label %344, label %548

344:                                              ; preds = %339
  %345 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* null) #6
  %346 = icmp eq i32 %345, 0
  br i1 %346, label %347, label %548

347:                                              ; preds = %344
  %348 = load i32, i32* %63, align 4, !tbaa !9
  %349 = icmp sgt i32 %348, -1
  br i1 %349, label %355, label %350

350:                                              ; preds = %347
  %351 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %305, i64 0, i32 3
  %352 = load i8, i8* %351, align 8
  %353 = and i8 %352, 1
  %354 = icmp eq i8 %353, 0
  br i1 %354, label %548, label %355

355:                                              ; preds = %350, %347
  br i1 %9, label %408, label %356

356:                                              ; preds = %355
  %357 = tail call fastcc i32 @tre_add_tag_left(%struct.tre_mem_struct* noundef nonnull %0, %struct.tre_ast_node_t* noundef nonnull %112, i32 noundef %66) #7
  %358 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %305, i64 0, i32 3
  %359 = load i8, i8* %358, align 8
  %360 = and i8 %359, 1
  %361 = icmp eq i8 %360, 0
  %362 = load i32*, i32** %58, align 8, !tbaa !32
  %363 = sext i32 %66 to i64
  %364 = getelementptr inbounds i32, i32* %362, i64 %363
  %365 = select i1 %361, i32 %69, i32 1
  store i32 %365, i32* %364, align 4, !tbaa !16
  %366 = icmp sgt i32 %68, -1
  br i1 %366, label %367, label %385

367:                                              ; preds = %356
  %368 = load i32*, i32** %60, align 8, !tbaa !33
  br label %369

369:                                              ; preds = %369, %367
  %370 = phi i64 [ %374, %369 ], [ 0, %367 ]
  %371 = getelementptr inbounds i32, i32* %368, i64 %370
  %372 = load i32, i32* %371, align 4, !tbaa !9
  %373 = icmp sgt i32 %372, -1
  %374 = add nuw i64 %370, 1
  br i1 %373, label %369, label %375

375:                                              ; preds = %369
  %376 = and i64 %370, 4294967295
  %377 = getelementptr inbounds i32, i32* %368, i64 %376
  store i32 %66, i32* %377, align 4, !tbaa !9
  %378 = add i64 %370, 1
  %379 = and i64 %378, 4294967295
  %380 = getelementptr inbounds i32, i32* %368, i64 %379
  store i32 %68, i32* %380, align 4, !tbaa !9
  %381 = add i64 %370, 2
  %382 = and i64 %381, 4294967295
  %383 = getelementptr inbounds i32, i32* %368, i64 %382
  store i32 -1, i32* %383, align 4, !tbaa !9
  %384 = add nsw i32 %65, 1
  br label %385

385:                                              ; preds = %375, %356
  %386 = phi i32 [ -1, %375 ], [ %68, %356 ]
  %387 = phi i32 [ %384, %375 ], [ %65, %356 ]
  %388 = load i32, i32* %63, align 4, !tbaa !9
  %389 = icmp sgt i32 %388, -1
  br i1 %389, label %390, label %408

390:                                              ; preds = %385
  %391 = load %struct.tre_submatch_data*, %struct.tre_submatch_data** %59, align 8, !tbaa !34
  br label %392

392:                                              ; preds = %403, %390
  %393 = phi i64 [ 0, %390 ], [ %404, %403 ]
  %394 = phi i32 [ %388, %390 ], [ %406, %403 ]
  %395 = lshr i32 %394, 1
  %396 = and i32 %394, 1
  %397 = icmp eq i32 %396, 0
  %398 = zext i32 %395 to i64
  br i1 %397, label %399, label %401

399:                                              ; preds = %392
  %400 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %391, i64 %398, i32 0
  store i32 %66, i32* %400, align 8, !tbaa !73
  br label %403

401:                                              ; preds = %392
  %402 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %391, i64 %398, i32 1
  store i32 %66, i32* %402, align 4, !tbaa !74
  br label %403

403:                                              ; preds = %401, %399
  %404 = add nuw i64 %393, 1
  %405 = getelementptr inbounds i32, i32* %63, i64 %404
  %406 = load i32, i32* %405, align 4, !tbaa !9
  %407 = icmp sgt i32 %406, -1
  br i1 %407, label %392, label %408

408:                                              ; preds = %403, %385, %355
  %409 = phi i32 [ %68, %355 ], [ %386, %385 ], [ %386, %403 ]
  %410 = phi i32 [ %65, %355 ], [ %387, %385 ], [ %387, %403 ]
  %411 = phi i32 [ 0, %355 ], [ %357, %385 ], [ %357, %403 ]
  store i32 -1, i32* %63, align 4, !tbaa !9
  %412 = add nsw i32 %64, 1
  %413 = add nsw i32 %67, 1
  br label %548

414:                                              ; preds = %176
  %415 = getelementptr inbounds i8, i8* %111, i64 8
  %416 = bitcast i8* %415 to %struct.tre_union_t**
  %417 = load %struct.tre_union_t*, %struct.tre_union_t** %416, align 8, !tbaa !36
  %418 = bitcast %struct.tre_union_t* %417 to i8**
  %419 = load i8*, i8** %418, align 8, !tbaa !42
  %420 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %417, i64 0, i32 1
  %421 = bitcast %struct.tre_ast_node_t** %420 to i8**
  %422 = load i8*, i8** %421, align 8, !tbaa !40
  %423 = load i32, i32* %63, align 4, !tbaa !9
  %424 = icmp sgt i32 %423, -1
  %425 = add nsw i32 %67, 1
  %426 = select i1 %424, i32 %425, i32 %67
  %427 = zext i32 %426 to i64
  %428 = inttoptr i64 %427 to i8*
  %429 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %428) #6
  %430 = icmp eq i32 %429, 0
  br i1 %430, label %431, label %548

431:                                              ; preds = %414
  %432 = select i1 %424, i32 %67, i32 %66
  %433 = zext i32 %432 to i64
  %434 = inttoptr i64 %433 to i8*
  %435 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %434) #6
  %436 = icmp eq i32 %435, 0
  br i1 %436, label %437, label %548

437:                                              ; preds = %431
  %438 = bitcast i32* %63 to i8*
  %439 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* nonnull %438) #6
  %440 = icmp eq i32 %439, 0
  br i1 %440, label %441, label %548

441:                                              ; preds = %437
  %442 = load i32, i32* %63, align 4, !tbaa !9
  %443 = xor i32 %442, -1
  %444 = lshr i32 %443, 31
  %445 = zext i32 %444 to i64
  %446 = inttoptr i64 %445 to i8*
  %447 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %446) #6
  %448 = icmp eq i32 %447, 0
  br i1 %448, label %449, label %548

449:                                              ; preds = %441
  %450 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* nonnull %111) #6
  %451 = icmp eq i32 %450, 0
  br i1 %451, label %452, label %548

452:                                              ; preds = %449
  %453 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %422) #6
  %454 = icmp eq i32 %453, 0
  br i1 %454, label %455, label %548

455:                                              ; preds = %452
  %456 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %419) #6
  %457 = icmp eq i32 %456, 0
  br i1 %457, label %458, label %548

458:                                              ; preds = %455
  %459 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* nonnull inttoptr (i64 3 to i8*)) #6
  %460 = icmp eq i32 %459, 0
  br i1 %460, label %461, label %548

461:                                              ; preds = %458
  %462 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %422) #6
  %463 = icmp eq i32 %462, 0
  br i1 %463, label %464, label %548

464:                                              ; preds = %461
  %465 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* null) #6
  %466 = icmp eq i32 %465, 0
  br i1 %466, label %467, label %548

467:                                              ; preds = %464
  %468 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* nonnull inttoptr (i64 2 to i8*)) #6
  %469 = icmp eq i32 %468, 0
  br i1 %469, label %470, label %548

470:                                              ; preds = %467
  %471 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %419) #6
  %472 = icmp eq i32 %471, 0
  br i1 %472, label %473, label %548

473:                                              ; preds = %470
  %474 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* null) #6
  %475 = icmp eq i32 %474, 0
  br i1 %475, label %476, label %548

476:                                              ; preds = %473
  %477 = load i32, i32* %63, align 4, !tbaa !9
  %478 = icmp sgt i32 %477, -1
  br i1 %478, label %479, label %533

479:                                              ; preds = %476
  br i1 %9, label %527, label %480

480:                                              ; preds = %479
  %481 = tail call fastcc i32 @tre_add_tag_left(%struct.tre_mem_struct* noundef nonnull %0, %struct.tre_ast_node_t* noundef nonnull %112, i32 noundef %66) #7
  %482 = load i32*, i32** %58, align 8, !tbaa !32
  %483 = sext i32 %66 to i64
  %484 = getelementptr inbounds i32, i32* %482, i64 %483
  store i32 %69, i32* %484, align 4, !tbaa !16
  %485 = icmp sgt i32 %68, -1
  br i1 %485, label %486, label %504

486:                                              ; preds = %480
  %487 = load i32*, i32** %60, align 8, !tbaa !33
  br label %488

488:                                              ; preds = %488, %486
  %489 = phi i64 [ %493, %488 ], [ 0, %486 ]
  %490 = getelementptr inbounds i32, i32* %487, i64 %489
  %491 = load i32, i32* %490, align 4, !tbaa !9
  %492 = icmp sgt i32 %491, -1
  %493 = add nuw i64 %489, 1
  br i1 %492, label %488, label %494

494:                                              ; preds = %488
  %495 = and i64 %489, 4294967295
  %496 = getelementptr inbounds i32, i32* %487, i64 %495
  store i32 %66, i32* %496, align 4, !tbaa !9
  %497 = add i64 %489, 1
  %498 = and i64 %497, 4294967295
  %499 = getelementptr inbounds i32, i32* %487, i64 %498
  store i32 %68, i32* %499, align 4, !tbaa !9
  %500 = add i64 %489, 2
  %501 = and i64 %500, 4294967295
  %502 = getelementptr inbounds i32, i32* %487, i64 %501
  store i32 -1, i32* %502, align 4, !tbaa !9
  %503 = add nsw i32 %65, 1
  br label %504

504:                                              ; preds = %494, %480
  %505 = phi i32 [ -1, %494 ], [ %68, %480 ]
  %506 = phi i32 [ %503, %494 ], [ %65, %480 ]
  %507 = load i32, i32* %63, align 4, !tbaa !9
  %508 = icmp sgt i32 %507, -1
  br i1 %508, label %509, label %527

509:                                              ; preds = %504
  %510 = load %struct.tre_submatch_data*, %struct.tre_submatch_data** %59, align 8, !tbaa !34
  br label %511

511:                                              ; preds = %522, %509
  %512 = phi i64 [ 0, %509 ], [ %523, %522 ]
  %513 = phi i32 [ %507, %509 ], [ %525, %522 ]
  %514 = lshr i32 %513, 1
  %515 = and i32 %513, 1
  %516 = icmp eq i32 %515, 0
  %517 = zext i32 %514 to i64
  br i1 %516, label %518, label %520

518:                                              ; preds = %511
  %519 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %510, i64 %517, i32 0
  store i32 %66, i32* %519, align 8, !tbaa !73
  br label %522

520:                                              ; preds = %511
  %521 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %510, i64 %517, i32 1
  store i32 %66, i32* %521, align 4, !tbaa !74
  br label %522

522:                                              ; preds = %520, %518
  %523 = add nuw i64 %512, 1
  %524 = getelementptr inbounds i32, i32* %63, i64 %523
  %525 = load i32, i32* %524, align 4, !tbaa !9
  %526 = icmp sgt i32 %525, -1
  br i1 %526, label %511, label %527

527:                                              ; preds = %522, %504, %479
  %528 = phi i32 [ %68, %479 ], [ %505, %504 ], [ %505, %522 ]
  %529 = phi i32 [ %65, %479 ], [ %506, %504 ], [ %506, %522 ]
  %530 = phi i32 [ 0, %479 ], [ %481, %504 ], [ %481, %522 ]
  store i32 -1, i32* %63, align 4, !tbaa !9
  %531 = add nsw i32 %64, 1
  %532 = add nsw i32 %67, 2
  br label %533

533:                                              ; preds = %527, %476
  %534 = phi i32 [ %532, %527 ], [ %425, %476 ]
  %535 = phi i32 [ %528, %527 ], [ %68, %476 ]
  %536 = phi i32 [ %425, %527 ], [ %67, %476 ]
  %537 = phi i32 [ %67, %527 ], [ %66, %476 ]
  %538 = phi i32 [ %529, %527 ], [ %65, %476 ]
  %539 = phi i32 [ %531, %527 ], [ %64, %476 ]
  %540 = phi i32 [ %530, %527 ], [ 0, %476 ]
  %541 = getelementptr inbounds i8, i8* %111, i64 24
  %542 = bitcast i8* %541 to i32*
  %543 = load i32, i32* %542, align 8, !tbaa !22
  %544 = icmp sgt i32 %543, 0
  %545 = add nsw i32 %536, 2
  %546 = select i1 %544, i32 %545, i32 %536
  %547 = select i1 %544, i32 %534, i32 %537
  br label %548

548:                                              ; preds = %533, %414, %431, %437, %441, %449, %452, %455, %458, %461, %464, %467, %470, %473, %314, %320, %325, %333, %336, %339, %344, %408, %350, %248, %258, %261, %265, %268, %286, %293, %296, %300, %179, %242, %188, %176
  %549 = phi i32 [ %69, %176 ], [ %69, %188 ], [ %69, %242 ], [ %69, %179 ], [ %69, %300 ], [ %69, %296 ], [ %69, %293 ], [ %69, %286 ], [ %69, %268 ], [ %69, %265 ], [ %69, %261 ], [ %69, %258 ], [ %69, %248 ], [ %69, %314 ], [ %69, %320 ], [ %69, %325 ], [ %69, %333 ], [ %69, %336 ], [ %69, %339 ], [ %69, %344 ], [ 0, %408 ], [ 0, %350 ], [ %69, %473 ], [ %69, %470 ], [ %69, %467 ], [ %69, %464 ], [ %69, %461 ], [ %69, %458 ], [ %69, %455 ], [ %69, %452 ], [ %69, %449 ], [ %69, %441 ], [ %69, %437 ], [ %69, %431 ], [ %69, %414 ], [ %69, %533 ]
  %550 = phi i32 [ %68, %176 ], [ %68, %188 ], [ %243, %242 ], [ %68, %179 ], [ %68, %300 ], [ %68, %296 ], [ %68, %293 ], [ %68, %286 ], [ %68, %268 ], [ %68, %265 ], [ %68, %261 ], [ %68, %258 ], [ %68, %248 ], [ %68, %314 ], [ %68, %320 ], [ %68, %325 ], [ %68, %333 ], [ %68, %336 ], [ %68, %339 ], [ %68, %344 ], [ %409, %408 ], [ %68, %350 ], [ %68, %473 ], [ %68, %470 ], [ %68, %467 ], [ %68, %464 ], [ %68, %461 ], [ %68, %458 ], [ %68, %455 ], [ %68, %452 ], [ %68, %449 ], [ %68, %441 ], [ %68, %437 ], [ %68, %431 ], [ %68, %414 ], [ %535, %533 ]
  %551 = phi i32 [ %67, %176 ], [ %67, %188 ], [ %247, %242 ], [ %67, %179 ], [ %288, %300 ], [ %288, %296 ], [ %288, %293 ], [ %288, %286 ], [ %67, %268 ], [ %67, %265 ], [ %67, %261 ], [ %67, %258 ], [ %67, %248 ], [ %67, %314 ], [ %67, %320 ], [ %67, %325 ], [ %67, %333 ], [ %67, %336 ], [ %67, %339 ], [ %67, %344 ], [ %413, %408 ], [ %67, %350 ], [ %67, %473 ], [ %67, %470 ], [ %67, %467 ], [ %67, %464 ], [ %67, %461 ], [ %67, %458 ], [ %67, %455 ], [ %67, %452 ], [ %67, %449 ], [ %67, %441 ], [ %67, %437 ], [ %67, %431 ], [ %67, %414 ], [ %546, %533 ]
  %552 = phi i32 [ %66, %176 ], [ %66, %188 ], [ %67, %242 ], [ %66, %179 ], [ %66, %300 ], [ %66, %296 ], [ %66, %293 ], [ %66, %286 ], [ %66, %268 ], [ %66, %265 ], [ %66, %261 ], [ %66, %258 ], [ %66, %248 ], [ %66, %314 ], [ %66, %320 ], [ %66, %325 ], [ %66, %333 ], [ %66, %336 ], [ %66, %339 ], [ %66, %344 ], [ %67, %408 ], [ %66, %350 ], [ %66, %473 ], [ %66, %470 ], [ %66, %467 ], [ %66, %464 ], [ %66, %461 ], [ %66, %458 ], [ %66, %455 ], [ %66, %452 ], [ %66, %449 ], [ %66, %441 ], [ %66, %437 ], [ %66, %431 ], [ %66, %414 ], [ %547, %533 ]
  %553 = phi i32 [ %65, %176 ], [ %65, %188 ], [ %244, %242 ], [ %65, %179 ], [ %65, %300 ], [ %65, %296 ], [ %65, %293 ], [ %65, %286 ], [ %65, %268 ], [ %65, %265 ], [ %65, %261 ], [ %65, %258 ], [ %65, %248 ], [ %65, %314 ], [ %65, %320 ], [ %65, %325 ], [ %65, %333 ], [ %65, %336 ], [ %65, %339 ], [ %65, %344 ], [ %410, %408 ], [ %65, %350 ], [ %65, %473 ], [ %65, %470 ], [ %65, %467 ], [ %65, %464 ], [ %65, %461 ], [ %65, %458 ], [ %65, %455 ], [ %65, %452 ], [ %65, %449 ], [ %65, %441 ], [ %65, %437 ], [ %65, %431 ], [ %65, %414 ], [ %538, %533 ]
  %554 = phi i32 [ %64, %176 ], [ %64, %188 ], [ %246, %242 ], [ %64, %179 ], [ %64, %300 ], [ %64, %296 ], [ %64, %293 ], [ %64, %286 ], [ %64, %268 ], [ %64, %265 ], [ %64, %261 ], [ %64, %258 ], [ %64, %248 ], [ %64, %314 ], [ %64, %320 ], [ %64, %325 ], [ %64, %333 ], [ %64, %336 ], [ %64, %339 ], [ %64, %344 ], [ %412, %408 ], [ %64, %350 ], [ %64, %473 ], [ %64, %470 ], [ %64, %467 ], [ %64, %464 ], [ %64, %461 ], [ %64, %458 ], [ %64, %455 ], [ %64, %452 ], [ %64, %449 ], [ %64, %441 ], [ %64, %437 ], [ %64, %431 ], [ %64, %414 ], [ %539, %533 ]
  %555 = phi i32 [ 0, %176 ], [ 0, %188 ], [ %245, %242 ], [ 0, %179 ], [ %301, %300 ], [ %298, %296 ], [ %294, %293 ], [ %291, %286 ], [ %274, %268 ], [ %266, %265 ], [ %263, %261 ], [ %259, %258 ], [ %256, %248 ], [ %318, %314 ], [ %323, %320 ], [ %331, %325 ], [ %334, %333 ], [ %337, %336 ], [ %342, %339 ], [ %345, %344 ], [ %411, %408 ], [ 0, %350 ], [ %474, %473 ], [ %471, %470 ], [ %468, %467 ], [ %465, %464 ], [ %462, %461 ], [ %459, %458 ], [ %456, %455 ], [ %453, %452 ], [ %450, %449 ], [ %447, %441 ], [ %439, %437 ], [ %435, %431 ], [ %429, %414 ], [ %540, %533 ]
  %556 = load i32, i32* %114, align 4, !tbaa !20
  %557 = icmp sgt i32 %556, -1
  br i1 %557, label %558, label %728

558:                                              ; preds = %548, %558
  %559 = phi i64 [ %563, %558 ], [ 0, %548 ]
  %560 = getelementptr inbounds i32, i32* %30, i64 %559
  %561 = load i32, i32* %560, align 4, !tbaa !9
  %562 = icmp sgt i32 %561, -1
  %563 = add nuw i64 %559, 1
  br i1 %562, label %558, label %564

564:                                              ; preds = %558
  %565 = and i64 %559, 4294967295
  %566 = getelementptr inbounds i32, i32* %30, i64 %565
  store i32 %556, i32* %566, align 4, !tbaa !9
  %567 = add i64 %559, 1
  %568 = and i64 %567, 4294967295
  %569 = getelementptr inbounds i32, i32* %30, i64 %568
  store i32 -1, i32* %569, align 4, !tbaa !9
  br label %728

570:                                              ; preds = %61
  %571 = add nsw i32 %62, -2
  store i32 %571, i32* %5, align 4, !tbaa !19
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %572, i32 0
  %574 = load i8*, i8** %573, align 8, !tbaa !16
  br i1 %9, label %575, label %591

575:                                              ; preds = %570
  %576 = getelementptr inbounds i8, i8* %574, i64 8
  %577 = bitcast i8* %576 to %struct.tre_iteration_t**
  %578 = load %struct.tre_iteration_t*, %struct.tre_iteration_t** %577, align 8, !tbaa !36
  %579 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %578, i64 0, i32 0
  %580 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %579, align 8, !tbaa !43
  %581 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %580, i64 0, i32 5
  %582 = load i32, i32* %581, align 4, !tbaa !75
  %583 = add nsw i32 %62, -3
  store i32 %583, i32* %5, align 4, !tbaa !19
  %584 = sext i32 %583 to i64
  %585 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %584
  %586 = bitcast %union.tre_stack_item* %585 to i32*
  %587 = load i32, i32* %586, align 8, !tbaa !16
  %588 = add nsw i32 %587, %582
  %589 = getelementptr inbounds i8, i8* %574, i64 28
  %590 = bitcast i8* %589 to i32*
  store i32 %588, i32* %590, align 4, !tbaa !75
  br label %603

591:                                              ; preds = %570
  %592 = add nsw i32 %62, -3
  store i32 %592, i32* %5, align 4, !tbaa !19
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %593
  %595 = bitcast %union.tre_stack_item* %594 to i32*
  %596 = load i32, i32* %595, align 8, !tbaa !16
  %597 = add nsw i32 %62, -4
  store i32 %597, i32* %5, align 4, !tbaa !19
  %598 = sext i32 %597 to i64
  %599 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %598
  %600 = bitcast %union.tre_stack_item* %599 to i32*
  %601 = load i32, i32* %600, align 8, !tbaa !16
  %602 = icmp eq i32 %596, 0
  br i1 %602, label %603, label %605

603:                                              ; preds = %575, %591
  %604 = phi i32 [ -1, %575 ], [ %68, %591 ]
  br label %605

605:                                              ; preds = %591, %603
  %606 = phi i32 [ %604, %603 ], [ %601, %591 ]
  %607 = phi i32 [ 1, %603 ], [ 0, %591 ]
  %608 = select i1 %9, i32 %69, i32 %607
  br label %728

609:                                              ; preds = %61
  %610 = add nsw i32 %62, -2
  store i32 %610, i32* %5, align 4, !tbaa !19
  %611 = sext i32 %610 to i64
  %612 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %611
  %613 = bitcast %union.tre_stack_item* %612 to i32*
  %614 = load i32, i32* %613, align 8, !tbaa !16
  %615 = add nsw i32 %62, -3
  store i32 %615, i32* %5, align 4, !tbaa !19
  %616 = sext i32 %615 to i64
  %617 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %616
  %618 = bitcast %union.tre_stack_item* %617 to i32*
  %619 = load i32, i32* %618, align 8, !tbaa !16
  %620 = icmp slt i32 %614, 0
  %621 = select i1 %620, i32 %66, i32 %614
  br label %728

622:                                              ; preds = %61
  %623 = add nsw i32 %62, -2
  store i32 %623, i32* %5, align 4, !tbaa !19
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %624, i32 0
  %626 = load i8*, i8** %625, align 8, !tbaa !16
  br i1 %9, label %627, label %728

627:                                              ; preds = %622
  %628 = getelementptr inbounds i8, i8* %626, i64 8
  %629 = bitcast i8* %628 to %struct.tre_catenation_t**
  %630 = load %struct.tre_catenation_t*, %struct.tre_catenation_t** %629, align 8, !tbaa !36
  %631 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %630, i64 0, i32 0
  %632 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %631, align 8, !tbaa !42
  %633 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %632, i64 0, i32 5
  %634 = load i32, i32* %633, align 4, !tbaa !75
  %635 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %630, i64 0, i32 1
  %636 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %635, align 8, !tbaa !40
  %637 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %636, i64 0, i32 5
  %638 = load i32, i32* %637, align 4, !tbaa !75
  %639 = add nsw i32 %638, %634
  %640 = getelementptr inbounds i8, i8* %626, i64 28
  %641 = bitcast i8* %640 to i32*
  store i32 %639, i32* %641, align 4, !tbaa !75
  br label %728

642:                                              ; preds = %61, %642
  %643 = phi i32* [ %646, %642 ], [ %63, %61 ]
  %644 = load i32, i32* %643, align 4, !tbaa !9
  %645 = icmp sgt i32 %644, -1
  %646 = getelementptr inbounds i32, i32* %643, i64 1
  br i1 %645, label %642, label %728

647:                                              ; preds = %61
  %648 = add nsw i32 %62, -2
  store i32 %648, i32* %5, align 4, !tbaa !19
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %649, i32 0
  %651 = bitcast i8** %650 to %struct.tre_ast_node_t**
  %652 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %651, align 8, !tbaa !16
  %653 = add nsw i32 %62, -3
  store i32 %653, i32* %5, align 4, !tbaa !19
  %654 = sext i32 %653 to i64
  %655 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %654, i32 0
  %656 = bitcast i8** %655 to %struct.tre_ast_node_t**
  %657 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %656, align 8, !tbaa !16
  %658 = add nsw i32 %62, -4
  store i32 %658, i32* %5, align 4, !tbaa !19
  %659 = sext i32 %658 to i64
  %660 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %659, i32 0
  %661 = load i8*, i8** %660, align 8, !tbaa !16
  %662 = add nsw i32 %62, -5
  store i32 %662, i32* %5, align 4, !tbaa !19
  br i1 %9, label %667, label %663

663:                                              ; preds = %647
  %664 = getelementptr inbounds i8, i8* %661, i64 24
  %665 = bitcast i8* %664 to i32*
  %666 = load i32, i32* %665, align 8, !tbaa !22
  br label %693

667:                                              ; preds = %647
  %668 = sext i32 %662 to i64
  %669 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %668
  %670 = bitcast %union.tre_stack_item* %669 to i32*
  %671 = load i32, i32* %670, align 8, !tbaa !16
  %672 = getelementptr inbounds i8, i8* %661, i64 8
  %673 = bitcast i8* %672 to %struct.tre_union_t**
  %674 = load %struct.tre_union_t*, %struct.tre_union_t** %673, align 8, !tbaa !36
  %675 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %674, i64 0, i32 0
  %676 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %675, align 8, !tbaa !42
  %677 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %676, i64 0, i32 5
  %678 = load i32, i32* %677, align 4, !tbaa !75
  %679 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %674, i64 0, i32 1
  %680 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %679, align 8, !tbaa !40
  %681 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %680, i64 0, i32 5
  %682 = load i32, i32* %681, align 4, !tbaa !75
  %683 = getelementptr inbounds i8, i8* %661, i64 24
  %684 = bitcast i8* %683 to i32*
  %685 = load i32, i32* %684, align 8, !tbaa !22
  %686 = icmp sgt i32 %685, 0
  %687 = select i1 %686, i32 2, i32 0
  %688 = add i32 %678, %671
  %689 = add i32 %688, %682
  %690 = add i32 %689, %687
  %691 = getelementptr inbounds i8, i8* %661, i64 28
  %692 = bitcast i8* %691 to i32*
  store i32 %690, i32* %692, align 4, !tbaa !75
  br label %693

693:                                              ; preds = %663, %667
  %694 = phi i32 [ %666, %663 ], [ %685, %667 ]
  %695 = add nsw i32 %62, -6
  store i32 %695, i32* %5, align 4, !tbaa !19
  %696 = sext i32 %695 to i64
  %697 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %696, i32 0
  %698 = bitcast i8** %697 to i32**
  %699 = load i32*, i32** %698, align 8, !tbaa !16
  %700 = add nsw i32 %62, -7
  store i32 %700, i32* %5, align 4, !tbaa !19
  %701 = sext i32 %700 to i64
  %702 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %701
  %703 = bitcast %union.tre_stack_item* %702 to i32*
  %704 = load i32, i32* %703, align 8, !tbaa !16
  %705 = add nsw i32 %62, -8
  store i32 %705, i32* %5, align 4, !tbaa !19
  %706 = sext i32 %705 to i64
  %707 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %70, i64 %706
  %708 = bitcast %union.tre_stack_item* %707 to i32*
  %709 = load i32, i32* %708, align 8, !tbaa !16
  %710 = icmp sgt i32 %694, 0
  br i1 %710, label %711, label %728

711:                                              ; preds = %693
  br i1 %9, label %725, label %712

712:                                              ; preds = %711
  %713 = tail call fastcc i32 @tre_add_tag_right(%struct.tre_mem_struct* noundef nonnull %0, %struct.tre_ast_node_t* noundef %652, i32 noundef %704) #7
  %714 = load i32*, i32** %58, align 8, !tbaa !32
  %715 = sext i32 %704 to i64
  %716 = getelementptr inbounds i32, i32* %714, i64 %715
  store i32 1, i32* %716, align 4, !tbaa !16
  %717 = icmp eq i32 %713, 0
  br i1 %717, label %718, label %720

718:                                              ; preds = %712
  %719 = tail call fastcc i32 @tre_add_tag_right(%struct.tre_mem_struct* noundef nonnull %0, %struct.tre_ast_node_t* noundef %657, i32 noundef %709) #7
  br label %720

720:                                              ; preds = %718, %712
  %721 = phi i32 [ %719, %718 ], [ %713, %712 ]
  %722 = load i32*, i32** %58, align 8, !tbaa !32
  %723 = sext i32 %709 to i64
  %724 = getelementptr inbounds i32, i32* %722, i64 %723
  store i32 1, i32* %724, align 4, !tbaa !16
  br label %725

725:                                              ; preds = %720, %711
  %726 = phi i32 [ 0, %711 ], [ %721, %720 ]
  %727 = add nsw i32 %64, 2
  br label %728

728:                                              ; preds = %642, %693, %725, %61, %622, %627, %548, %564, %609, %605, %102
  %729 = phi i32 [ %69, %61 ], [ %69, %627 ], [ %69, %622 ], [ %69, %609 ], [ %608, %605 ], [ %549, %564 ], [ %549, %548 ], [ %69, %102 ], [ 1, %725 ], [ 1, %693 ], [ %69, %642 ]
  %730 = phi i32 [ %68, %61 ], [ %68, %627 ], [ %68, %622 ], [ %68, %609 ], [ %606, %605 ], [ %550, %564 ], [ %550, %548 ], [ %68, %102 ], [ %68, %725 ], [ %68, %693 ], [ %68, %642 ]
  %731 = phi i32 [ %67, %61 ], [ %67, %627 ], [ %67, %622 ], [ %619, %609 ], [ %67, %605 ], [ %551, %564 ], [ %551, %548 ], [ %67, %102 ], [ %67, %725 ], [ %67, %693 ], [ %67, %642 ]
  %732 = phi i32 [ %66, %61 ], [ %66, %627 ], [ %66, %622 ], [ %621, %609 ], [ %66, %605 ], [ %552, %564 ], [ %552, %548 ], [ %66, %102 ], [ %66, %725 ], [ %66, %693 ], [ %66, %642 ]
  %733 = phi i32 [ %65, %61 ], [ %65, %627 ], [ %65, %622 ], [ %65, %609 ], [ %65, %605 ], [ %553, %564 ], [ %553, %548 ], [ %65, %102 ], [ %65, %725 ], [ %65, %693 ], [ %65, %642 ]
  %734 = phi i32 [ %64, %61 ], [ %64, %627 ], [ %64, %622 ], [ %64, %609 ], [ %64, %605 ], [ %554, %564 ], [ %554, %548 ], [ %64, %102 ], [ %727, %725 ], [ %64, %693 ], [ %64, %642 ]
  %735 = phi i32* [ %63, %61 ], [ %63, %627 ], [ %63, %622 ], [ %63, %609 ], [ %63, %605 ], [ %63, %564 ], [ %63, %548 ], [ %63, %102 ], [ %699, %725 ], [ %699, %693 ], [ %643, %642 ]
  %736 = phi i32 [ 0, %61 ], [ 0, %627 ], [ 0, %622 ], [ 0, %609 ], [ 0, %605 ], [ %555, %564 ], [ %555, %548 ], [ 0, %102 ], [ %726, %725 ], [ 0, %693 ], [ 0, %642 ]
  %737 = load i32, i32* %5, align 4, !tbaa !19
  %738 = icmp sle i32 %737, %6
  %739 = icmp ne i32 %736, 0
  %740 = select i1 %738, i1 true, i1 %739
  br i1 %740, label %741, label %61

741:                                              ; preds = %142, %173, %167, %728, %48
  %742 = phi i32 [ -1, %48 ], [ %68, %142 ], [ %68, %173 ], [ %68, %167 ], [ %730, %728 ]
  %743 = phi i32 [ 0, %48 ], [ %66, %142 ], [ %66, %173 ], [ %66, %167 ], [ %732, %728 ]
  %744 = phi i32 [ 0, %48 ], [ %65, %142 ], [ %65, %173 ], [ %65, %167 ], [ %733, %728 ]
  %745 = phi i32 [ 0, %48 ], [ %64, %142 ], [ %64, %173 ], [ %64, %167 ], [ %734, %728 ]
  %746 = phi i32* [ %22, %48 ], [ %63, %142 ], [ %63, %173 ], [ %63, %167 ], [ %735, %728 ]
  %747 = phi i32 [ %51, %48 ], [ 12, %142 ], [ %174, %173 ], [ %171, %167 ], [ %736, %728 ]
  br i1 %9, label %791, label %748

748:                                              ; preds = %741
  %749 = load i32, i32* %746, align 4, !tbaa !9
  %750 = icmp sgt i32 %749, -1
  br i1 %750, label %751, label %770

751:                                              ; preds = %748
  %752 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 4
  %753 = load %struct.tre_submatch_data*, %struct.tre_submatch_data** %752, align 8, !tbaa !34
  br label %754

754:                                              ; preds = %765, %751
  %755 = phi i64 [ 0, %751 ], [ %766, %765 ]
  %756 = phi i32 [ %749, %751 ], [ %768, %765 ]
  %757 = lshr i32 %756, 1
  %758 = and i32 %756, 1
  %759 = icmp eq i32 %758, 0
  %760 = zext i32 %757 to i64
  br i1 %759, label %761, label %763

761:                                              ; preds = %754
  %762 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %753, i64 %760, i32 0
  store i32 %743, i32* %762, align 8, !tbaa !73
  br label %765

763:                                              ; preds = %754
  %764 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %753, i64 %760, i32 1
  store i32 %743, i32* %764, align 4, !tbaa !74
  br label %765

765:                                              ; preds = %763, %761
  %766 = add nuw i64 %755, 1
  %767 = getelementptr inbounds i32, i32* %746, i64 %766
  %768 = load i32, i32* %767, align 4, !tbaa !9
  %769 = icmp sgt i32 %768, -1
  br i1 %769, label %754, label %770

770:                                              ; preds = %765, %748
  store i32 -1, i32* %746, align 4, !tbaa !9
  %771 = icmp sgt i32 %742, -1
  br i1 %771, label %772, label %791

772:                                              ; preds = %770
  %773 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 9
  %774 = load i32*, i32** %773, align 8, !tbaa !33
  br label %775

775:                                              ; preds = %775, %772
  %776 = phi i64 [ %780, %775 ], [ 0, %772 ]
  %777 = getelementptr inbounds i32, i32* %774, i64 %776
  %778 = load i32, i32* %777, align 4, !tbaa !9
  %779 = icmp sgt i32 %778, -1
  %780 = add nuw i64 %776, 1
  br i1 %779, label %775, label %781

781:                                              ; preds = %775
  %782 = and i64 %776, 4294967295
  %783 = getelementptr inbounds i32, i32* %774, i64 %782
  store i32 %743, i32* %783, align 4, !tbaa !9
  %784 = add i64 %776, 1
  %785 = and i64 %784, 4294967295
  %786 = getelementptr inbounds i32, i32* %774, i64 %785
  store i32 %742, i32* %786, align 4, !tbaa !9
  %787 = add i64 %776, 2
  %788 = and i64 %787, 4294967295
  %789 = getelementptr inbounds i32, i32* %774, i64 %788
  store i32 -1, i32* %789, align 4, !tbaa !9
  %790 = add nsw i32 %744, 1
  br label %791

791:                                              ; preds = %741, %781, %770
  %792 = phi i32 [ %790, %781 ], [ %744, %770 ], [ %744, %741 ]
  %793 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 12
  store i32 %745, i32* %793, align 8, !tbaa !68
  %794 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 10
  store i32 %745, i32* %794, align 8, !tbaa !31
  %795 = getelementptr inbounds %struct.tnfa, %struct.tnfa* %3, i64 0, i32 11
  store i32 %792, i32* %795, align 4, !tbaa !76
  tail call void @free(i8* noundef nonnull %21) #6
  br label %796

796:                                              ; preds = %32, %791
  %797 = phi i8* [ %29, %791 ], [ %21, %32 ]
  %798 = phi i8* [ %37, %791 ], [ %29, %32 ]
  %799 = phi i32 [ %747, %791 ], [ 12, %32 ]
  tail call void @free(i8* noundef nonnull %797) #6
  br label %800

800:                                              ; preds = %796, %24
  %801 = phi i8* [ %21, %24 ], [ %798, %796 ]
  %802 = phi i32 [ 12, %24 ], [ %799, %796 ]
  tail call void @free(i8* noundef nonnull %801) #6
  br label %803

803:                                              ; preds = %800, %14
  %804 = phi i32 [ 12, %14 ], [ %802, %800 ]
  ret i32 %804
}

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #0 {
  %5 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef 40) #6
  %6 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_node(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef %5) #7
  %7 = icmp eq %struct.tre_ast_node_t* %6, null
  br i1 %7, label %16, label %8

8:                                                ; preds = %4
  %9 = sext i32 %1 to i64
  %10 = bitcast i8* %5 to i64*
  store i64 %9, i64* %10, align 8, !tbaa !37
  %11 = sext i32 %2 to i64
  %12 = getelementptr inbounds i8, i8* %5, i64 8
  %13 = bitcast i8* %12 to i64*
  store i64 %11, i64* %13, align 8, !tbaa !77
  %14 = getelementptr inbounds i8, i8* %5, i64 16
  %15 = bitcast i8* %14 to i32*
  store i32 %3, i32* %15, align 8, !tbaa !39
  br label %16

16:                                               ; preds = %4, %8
  ret %struct.tre_ast_node_t* %6
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.tre_ast_node_t* @tre_ast_new_catenation(%struct.tre_mem_struct* noundef %0, %struct.tre_ast_node_t* noundef %1, %struct.tre_ast_node_t* noundef %2) unnamed_addr #0 {
  %4 = icmp eq %struct.tre_ast_node_t* %1, null
  br i1 %4, label %19, label %5

5:                                                ; preds = %3
  %6 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef 16) #6
  %7 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_node(%struct.tre_mem_struct* noundef %0, i32 noundef 1, i8* noundef %6) #7
  %8 = icmp eq %struct.tre_ast_node_t* %7, null
  br i1 %8, label %19, label %9

9:                                                ; preds = %5
  %10 = bitcast i8* %6 to %struct.tre_ast_node_t**
  store %struct.tre_ast_node_t* %1, %struct.tre_ast_node_t** %10, align 8, !tbaa !42
  %11 = getelementptr inbounds i8, i8* %6, i64 8
  %12 = bitcast i8* %11 to %struct.tre_ast_node_t**
  store %struct.tre_ast_node_t* %2, %struct.tre_ast_node_t** %12, align 8, !tbaa !40
  %13 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %1, i64 0, i32 4
  %14 = load i32, i32* %13, align 8, !tbaa !22
  %15 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %2, i64 0, i32 4
  %16 = load i32, i32* %15, align 8, !tbaa !22
  %17 = add nsw i32 %16, %14
  %18 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %7, i64 0, i32 4
  store i32 %17, i32* %18, align 8, !tbaa !22
  br label %19

19:                                               ; preds = %5, %3, %9
  %20 = phi %struct.tre_ast_node_t* [ %7, %9 ], [ %2, %3 ], [ null, %5 ]
  ret %struct.tre_ast_node_t* %20
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @tre_compute_nfl(%struct.tre_mem_struct* noundef %0, %struct.tre_stack_rec* noundef %1, %struct.tre_ast_node_t* noundef %2) unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %1, i64 0, i32 3
  %7 = load i32, i32* %6, align 4, !tbaa !19
  %8 = bitcast %struct.tre_ast_node_t* %2 to i8*
  %9 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %8) #6
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %398

11:                                               ; preds = %3
  %12 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* null) #6
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %398

14:                                               ; preds = %11
  %15 = load i32, i32* %6, align 4, !tbaa !19
  %16 = icmp sgt i32 %15, %7
  br i1 %16, label %17, label %398

17:                                               ; preds = %14
  %18 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %1, i64 0, i32 4
  %19 = bitcast i32* %4 to i8*
  %20 = bitcast i32* %5 to i8*
  br label %21

21:                                               ; preds = %17, %395
  %22 = phi i32 [ %15, %17 ], [ %396, %395 ]
  %23 = load %union.tre_stack_item*, %union.tre_stack_item** %18, align 8, !tbaa !3
  %24 = add nsw i32 %22, -1
  store i32 %24, i32* %6, align 4, !tbaa !19
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %23, i64 %25
  %27 = bitcast %union.tre_stack_item* %26 to i32*
  %28 = load i32, i32* %27, align 8, !tbaa !16
  %29 = add nsw i32 %22, -2
  store i32 %29, i32* %6, align 4, !tbaa !19
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %23, i64 %30, i32 0
  %32 = load i8*, i8** %31, align 8, !tbaa !16
  switch i32 %28, label %395 [
    i32 0, label %33
    i32 1, label %231
    i32 3, label %271
    i32 2, label %294
  ]

33:                                               ; preds = %21
  %34 = bitcast i8* %32 to i32*
  %35 = load i32, i32* %34, align 8, !tbaa !35
  switch i32 %35, label %395 [
    i32 0, label %36
    i32 3, label %161
    i32 1, label %188
    i32 2, label %215
  ]

36:                                               ; preds = %33
  %37 = getelementptr inbounds i8, i8* %32, i64 8
  %38 = bitcast i8* %37 to %struct.tre_literal_t**
  %39 = load %struct.tre_literal_t*, %struct.tre_literal_t** %38, align 8, !tbaa !36
  %40 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %39, i64 0, i32 0
  %41 = load i64, i64* %40, align 8, !tbaa !37
  %42 = icmp eq i64 %41, -4
  br i1 %42, label %43, label %102

43:                                               ; preds = %36
  %44 = getelementptr inbounds i8, i8* %32, i64 16
  %45 = bitcast i8* %44 to i32*
  store i32 0, i32* %45, align 8, !tbaa !78
  %46 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %39, i64 0, i32 2
  %47 = load i32, i32* %46, align 8, !tbaa !39
  %48 = call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef 112) #6
  %49 = icmp eq i8* %48, null
  br i1 %49, label %50, label %53

50:                                               ; preds = %43
  %51 = getelementptr inbounds i8, i8* %32, i64 32
  %52 = bitcast i8* %51 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* null, %struct.tre_pos_and_tags_t** %52, align 8, !tbaa !52
  br label %398

53:                                               ; preds = %43
  %54 = bitcast i8* %48 to i32*
  store i32 %47, i32* %54, align 8, !tbaa !53
  %55 = getelementptr inbounds i8, i8* %48, i64 4
  %56 = bitcast i8* %55 to i32*
  store i32 0, i32* %56, align 4, !tbaa !79
  %57 = getelementptr inbounds i8, i8* %48, i64 8
  %58 = bitcast i8* %57 to i32*
  store i32 1114111, i32* %58, align 8, !tbaa !80
  %59 = getelementptr inbounds i8, i8* %48, i64 32
  %60 = bitcast i8* %59 to i64*
  store i64 0, i64* %60, align 8, !tbaa !81
  %61 = getelementptr inbounds i8, i8* %48, i64 40
  %62 = bitcast i8* %61 to i64**
  store i64* null, i64** %62, align 8, !tbaa !82
  %63 = getelementptr inbounds i8, i8* %48, i64 48
  %64 = bitcast i8* %63 to i32*
  store i32 -1, i32* %64, align 8, !tbaa !83
  %65 = getelementptr inbounds i8, i8* %48, i64 56
  %66 = bitcast i8* %65 to i32*
  store i32 -1, i32* %66, align 8, !tbaa !53
  %67 = getelementptr inbounds i8, i8* %48, i64 60
  %68 = bitcast i8* %67 to i32*
  store i32 -1, i32* %68, align 4, !tbaa !79
  %69 = getelementptr inbounds i8, i8* %48, i64 64
  %70 = bitcast i8* %69 to i32*
  store i32 -1, i32* %70, align 8, !tbaa !80
  %71 = getelementptr inbounds i8, i8* %32, i64 32
  %72 = bitcast i8* %71 to i8**
  store i8* %48, i8** %72, align 8, !tbaa !52
  %73 = load i32, i32* %46, align 8, !tbaa !39
  %74 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %39, i64 0, i32 1
  %75 = load i64, i64* %74, align 8, !tbaa !77
  %76 = call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef 112) #6
  %77 = icmp eq i8* %76, null
  br i1 %77, label %78, label %81

78:                                               ; preds = %53
  %79 = getelementptr inbounds i8, i8* %32, i64 40
  %80 = bitcast i8* %79 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* null, %struct.tre_pos_and_tags_t** %80, align 8, !tbaa !63
  br label %398

81:                                               ; preds = %53
  %82 = trunc i64 %75 to i32
  %83 = bitcast i8* %76 to i32*
  store i32 %73, i32* %83, align 8, !tbaa !53
  %84 = getelementptr inbounds i8, i8* %76, i64 4
  %85 = bitcast i8* %84 to i32*
  store i32 0, i32* %85, align 4, !tbaa !79
  %86 = getelementptr inbounds i8, i8* %76, i64 8
  %87 = bitcast i8* %86 to i32*
  store i32 1114111, i32* %87, align 8, !tbaa !80
  %88 = getelementptr inbounds i8, i8* %76, i64 32
  %89 = bitcast i8* %88 to i64*
  store i64 0, i64* %89, align 8, !tbaa !81
  %90 = getelementptr inbounds i8, i8* %76, i64 40
  %91 = bitcast i8* %90 to i64**
  store i64* null, i64** %91, align 8, !tbaa !82
  %92 = getelementptr inbounds i8, i8* %76, i64 48
  %93 = bitcast i8* %92 to i32*
  store i32 %82, i32* %93, align 8, !tbaa !83
  %94 = getelementptr inbounds i8, i8* %76, i64 56
  %95 = bitcast i8* %94 to i32*
  store i32 -1, i32* %95, align 8, !tbaa !53
  %96 = getelementptr inbounds i8, i8* %76, i64 60
  %97 = bitcast i8* %96 to i32*
  store i32 -1, i32* %97, align 4, !tbaa !79
  %98 = getelementptr inbounds i8, i8* %76, i64 64
  %99 = bitcast i8* %98 to i32*
  store i32 -1, i32* %99, align 8, !tbaa !80
  %100 = getelementptr inbounds i8, i8* %32, i64 40
  %101 = bitcast i8* %100 to i8**
  store i8* %76, i8** %101, align 8, !tbaa !63
  br label %395

102:                                              ; preds = %36
  %103 = icmp slt i64 %41, 0
  %104 = getelementptr inbounds i8, i8* %32, i64 16
  %105 = bitcast i8* %104 to i32*
  br i1 %103, label %106, label %116

106:                                              ; preds = %102
  store i32 1, i32* %105, align 8, !tbaa !78
  %107 = call fastcc %struct.tre_pos_and_tags_t* @tre_set_empty(%struct.tre_mem_struct* noundef %0) #7
  %108 = getelementptr inbounds i8, i8* %32, i64 32
  %109 = bitcast i8* %108 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* %107, %struct.tre_pos_and_tags_t** %109, align 8, !tbaa !52
  %110 = icmp eq %struct.tre_pos_and_tags_t* %107, null
  br i1 %110, label %398, label %111

111:                                              ; preds = %106
  %112 = call fastcc %struct.tre_pos_and_tags_t* @tre_set_empty(%struct.tre_mem_struct* noundef %0) #7
  %113 = getelementptr inbounds i8, i8* %32, i64 40
  %114 = bitcast i8* %113 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* %112, %struct.tre_pos_and_tags_t** %114, align 8, !tbaa !63
  %115 = icmp eq %struct.tre_pos_and_tags_t* %112, null
  br i1 %115, label %398, label %395

116:                                              ; preds = %102
  store i32 0, i32* %105, align 8, !tbaa !78
  %117 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %39, i64 0, i32 2
  %118 = load i32, i32* %117, align 8, !tbaa !39
  %119 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %39, i64 0, i32 1
  %120 = load i64, i64* %119, align 8, !tbaa !77
  %121 = call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef 112) #6
  %122 = icmp eq i8* %121, null
  br i1 %122, label %123, label %126

123:                                              ; preds = %116
  %124 = getelementptr inbounds i8, i8* %32, i64 32
  %125 = bitcast i8* %124 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* null, %struct.tre_pos_and_tags_t** %125, align 8, !tbaa !52
  br label %398

126:                                              ; preds = %116
  %127 = trunc i64 %120 to i32
  %128 = trunc i64 %41 to i32
  %129 = bitcast i8* %121 to i32*
  store i32 %118, i32* %129, align 8, !tbaa !53
  %130 = getelementptr inbounds i8, i8* %121, i64 4
  %131 = bitcast i8* %130 to i32*
  store i32 %128, i32* %131, align 4, !tbaa !79
  %132 = getelementptr inbounds i8, i8* %121, i64 8
  %133 = bitcast i8* %132 to i32*
  store i32 %127, i32* %133, align 8, !tbaa !80
  %134 = getelementptr inbounds i8, i8* %121, i64 32
  %135 = bitcast i8* %134 to i64*
  store i64 0, i64* %135, align 8, !tbaa !81
  %136 = getelementptr inbounds i8, i8* %121, i64 40
  %137 = bitcast i8* %136 to i64**
  store i64* null, i64** %137, align 8, !tbaa !82
  %138 = getelementptr inbounds i8, i8* %121, i64 48
  %139 = bitcast i8* %138 to i32*
  store i32 -1, i32* %139, align 8, !tbaa !83
  %140 = getelementptr inbounds i8, i8* %121, i64 56
  %141 = bitcast i8* %140 to i32*
  store i32 -1, i32* %141, align 8, !tbaa !53
  %142 = getelementptr inbounds i8, i8* %121, i64 60
  %143 = bitcast i8* %142 to i32*
  store i32 -1, i32* %143, align 4, !tbaa !79
  %144 = getelementptr inbounds i8, i8* %121, i64 64
  %145 = bitcast i8* %144 to i32*
  store i32 -1, i32* %145, align 8, !tbaa !80
  %146 = getelementptr inbounds i8, i8* %32, i64 32
  %147 = bitcast i8* %146 to i8**
  store i8* %121, i8** %147, align 8, !tbaa !52
  %148 = load i32, i32* %117, align 8, !tbaa !39
  %149 = load i64, i64* %40, align 8, !tbaa !37
  %150 = trunc i64 %149 to i32
  %151 = load i64, i64* %119, align 8, !tbaa !77
  %152 = trunc i64 %151 to i32
  %153 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %39, i64 0, i32 3
  %154 = load i64, i64* %153, align 8, !tbaa !84
  %155 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %39, i64 0, i32 4
  %156 = load i64*, i64** %155, align 8, !tbaa !85
  %157 = call fastcc %struct.tre_pos_and_tags_t* @tre_set_one(%struct.tre_mem_struct* noundef %0, i32 noundef %148, i32 noundef %150, i32 noundef %152, i64 noundef %154, i64* noundef %156, i32 noundef -1) #7
  %158 = getelementptr inbounds i8, i8* %32, i64 40
  %159 = bitcast i8* %158 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* %157, %struct.tre_pos_and_tags_t** %159, align 8, !tbaa !63
  %160 = icmp eq %struct.tre_pos_and_tags_t* %157, null
  br i1 %160, label %398, label %395

161:                                              ; preds = %33
  %162 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* nonnull %32) #6
  %163 = icmp eq i32 %162, 0
  br i1 %163, label %164, label %398

164:                                              ; preds = %161
  %165 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* nonnull inttoptr (i64 1 to i8*)) #6
  %166 = icmp eq i32 %165, 0
  br i1 %166, label %167, label %398

167:                                              ; preds = %164
  %168 = getelementptr inbounds i8, i8* %32, i64 8
  %169 = bitcast i8* %168 to %struct.tre_union_t**
  %170 = load %struct.tre_union_t*, %struct.tre_union_t** %169, align 8, !tbaa !36
  %171 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %170, i64 0, i32 1
  %172 = bitcast %struct.tre_ast_node_t** %171 to i8**
  %173 = load i8*, i8** %172, align 8, !tbaa !40
  %174 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* %173) #6
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %176, label %398

176:                                              ; preds = %167
  %177 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* null) #6
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %179, label %398

179:                                              ; preds = %176
  %180 = bitcast i8* %168 to i8***
  %181 = load i8**, i8*** %180, align 8, !tbaa !36
  %182 = load i8*, i8** %181, align 8, !tbaa !42
  %183 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* %182) #6
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %398

185:                                              ; preds = %179
  %186 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* null) #6
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %395, label %398

188:                                              ; preds = %33
  %189 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* nonnull %32) #6
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %191, label %398

191:                                              ; preds = %188
  %192 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* nonnull inttoptr (i64 2 to i8*)) #6
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %194, label %398

194:                                              ; preds = %191
  %195 = getelementptr inbounds i8, i8* %32, i64 8
  %196 = bitcast i8* %195 to %struct.tre_catenation_t**
  %197 = load %struct.tre_catenation_t*, %struct.tre_catenation_t** %196, align 8, !tbaa !36
  %198 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %197, i64 0, i32 1
  %199 = bitcast %struct.tre_ast_node_t** %198 to i8**
  %200 = load i8*, i8** %199, align 8, !tbaa !40
  %201 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* %200) #6
  %202 = icmp eq i32 %201, 0
  br i1 %202, label %203, label %398

203:                                              ; preds = %194
  %204 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* null) #6
  %205 = icmp eq i32 %204, 0
  br i1 %205, label %206, label %398

206:                                              ; preds = %203
  %207 = bitcast i8* %195 to i8***
  %208 = load i8**, i8*** %207, align 8, !tbaa !36
  %209 = load i8*, i8** %208, align 8, !tbaa !42
  %210 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* %209) #6
  %211 = icmp eq i32 %210, 0
  br i1 %211, label %212, label %398

212:                                              ; preds = %206
  %213 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* null) #6
  %214 = icmp eq i32 %213, 0
  br i1 %214, label %395, label %398

215:                                              ; preds = %33
  %216 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* nonnull %32) #6
  %217 = icmp eq i32 %216, 0
  br i1 %217, label %218, label %398

218:                                              ; preds = %215
  %219 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* nonnull inttoptr (i64 3 to i8*)) #6
  %220 = icmp eq i32 %219, 0
  br i1 %220, label %221, label %398

221:                                              ; preds = %218
  %222 = getelementptr inbounds i8, i8* %32, i64 8
  %223 = bitcast i8* %222 to i8***
  %224 = load i8**, i8*** %223, align 8, !tbaa !36
  %225 = load i8*, i8** %224, align 8, !tbaa !43
  %226 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* %225) #6
  %227 = icmp eq i32 %226, 0
  br i1 %227, label %228, label %398

228:                                              ; preds = %221
  %229 = call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* null) #6
  %230 = icmp eq i32 %229, 0
  br i1 %230, label %395, label %398

231:                                              ; preds = %21
  %232 = getelementptr inbounds i8, i8* %32, i64 8
  %233 = bitcast i8* %232 to %struct.tre_union_t**
  %234 = load %struct.tre_union_t*, %struct.tre_union_t** %233, align 8, !tbaa !36
  %235 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %234, i64 0, i32 0
  %236 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %235, align 8, !tbaa !42
  %237 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %236, i64 0, i32 2
  %238 = load i32, i32* %237, align 8, !tbaa !78
  %239 = icmp eq i32 %238, 0
  %240 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %234, i64 0, i32 1
  %241 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %240, align 8, !tbaa !40
  br i1 %239, label %242, label %246

242:                                              ; preds = %231
  %243 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %241, i64 0, i32 2
  %244 = load i32, i32* %243, align 8, !tbaa !78
  %245 = icmp ne i32 %244, 0
  br label %246

246:                                              ; preds = %231, %242
  %247 = phi i1 [ %245, %242 ], [ true, %231 ]
  %248 = zext i1 %247 to i32
  %249 = getelementptr inbounds i8, i8* %32, i64 16
  %250 = bitcast i8* %249 to i32*
  store i32 %248, i32* %250, align 8, !tbaa !78
  %251 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %236, i64 0, i32 6
  %252 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %251, align 8, !tbaa !52
  %253 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %241, i64 0, i32 6
  %254 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %253, align 8, !tbaa !52
  %255 = call fastcc %struct.tre_pos_and_tags_t* @tre_set_union(%struct.tre_mem_struct* noundef %0, %struct.tre_pos_and_tags_t* noundef %252, %struct.tre_pos_and_tags_t* noundef %254, i32* noundef null, i32 noundef 0) #7
  %256 = getelementptr inbounds i8, i8* %32, i64 32
  %257 = bitcast i8* %256 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* %255, %struct.tre_pos_and_tags_t** %257, align 8, !tbaa !52
  %258 = icmp eq %struct.tre_pos_and_tags_t* %255, null
  br i1 %258, label %398, label %259

259:                                              ; preds = %246
  %260 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %234, i64 0, i32 1
  %261 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %235, align 8, !tbaa !42
  %262 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %261, i64 0, i32 7
  %263 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %262, align 8, !tbaa !63
  %264 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %260, align 8, !tbaa !40
  %265 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %264, i64 0, i32 7
  %266 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %265, align 8, !tbaa !63
  %267 = call fastcc %struct.tre_pos_and_tags_t* @tre_set_union(%struct.tre_mem_struct* noundef %0, %struct.tre_pos_and_tags_t* noundef %263, %struct.tre_pos_and_tags_t* noundef %266, i32* noundef null, i32 noundef 0) #7
  %268 = getelementptr inbounds i8, i8* %32, i64 40
  %269 = bitcast i8* %268 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* %267, %struct.tre_pos_and_tags_t** %269, align 8, !tbaa !63
  %270 = icmp eq %struct.tre_pos_and_tags_t* %267, null
  br i1 %270, label %398, label %395

271:                                              ; preds = %21
  %272 = getelementptr inbounds i8, i8* %32, i64 8
  %273 = bitcast i8* %272 to %struct.tre_iteration_t**
  %274 = load %struct.tre_iteration_t*, %struct.tre_iteration_t** %273, align 8, !tbaa !36
  %275 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %274, i64 0, i32 1
  %276 = load i32, i32* %275, align 8, !tbaa !45
  %277 = icmp eq i32 %276, 0
  %278 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %274, i64 0, i32 0
  %279 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %278, align 8, !tbaa !43
  br i1 %277, label %285, label %280

280:                                              ; preds = %271
  %281 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %279, i64 0, i32 2
  %282 = load i32, i32* %281, align 8, !tbaa !78
  %283 = icmp ne i32 %282, 0
  %284 = zext i1 %283 to i32
  br label %285

285:                                              ; preds = %280, %271
  %286 = phi i32 [ 1, %271 ], [ %284, %280 ]
  %287 = getelementptr inbounds i8, i8* %32, i64 16
  %288 = bitcast i8* %287 to i32*
  store i32 %286, i32* %288, align 8, !tbaa !78
  %289 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %279, i64 0, i32 6
  %290 = getelementptr inbounds i8, i8* %32, i64 32
  %291 = bitcast %struct.tre_pos_and_tags_t** %289 to <2 x %struct.tre_pos_and_tags_t*>*
  %292 = load <2 x %struct.tre_pos_and_tags_t*>, <2 x %struct.tre_pos_and_tags_t*>* %291, align 8, !tbaa !47
  %293 = bitcast i8* %290 to <2 x %struct.tre_pos_and_tags_t*>*
  store <2 x %struct.tre_pos_and_tags_t*> %292, <2 x %struct.tre_pos_and_tags_t*>* %293, align 8, !tbaa !47
  br label %395

294:                                              ; preds = %21
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %19) #5
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %20) #5
  %295 = getelementptr inbounds i8, i8* %32, i64 8
  %296 = bitcast i8* %295 to %struct.tre_catenation_t**
  %297 = load %struct.tre_catenation_t*, %struct.tre_catenation_t** %296, align 8, !tbaa !36
  %298 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %297, i64 0, i32 0
  %299 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %298, align 8, !tbaa !42
  %300 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %299, i64 0, i32 2
  %301 = load i32, i32* %300, align 8, !tbaa !78
  %302 = icmp eq i32 %301, 0
  br i1 %302, label %309, label %303

303:                                              ; preds = %294
  %304 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %297, i64 0, i32 1
  %305 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %304, align 8, !tbaa !40
  %306 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %305, i64 0, i32 2
  %307 = load i32, i32* %306, align 8, !tbaa !78
  %308 = icmp ne i32 %307, 0
  br label %309

309:                                              ; preds = %303, %294
  %310 = phi i1 [ false, %294 ], [ %308, %303 ]
  %311 = zext i1 %310 to i32
  %312 = getelementptr inbounds i8, i8* %32, i64 16
  %313 = bitcast i8* %312 to i32*
  store i32 %311, i32* %313, align 8, !tbaa !78
  %314 = load i32, i32* %300, align 8, !tbaa !78
  %315 = icmp eq i32 %314, 0
  br i1 %315, label %345, label %316

316:                                              ; preds = %309
  %317 = call fastcc i32 @tre_match_empty(%struct.tre_stack_rec* noundef nonnull %1, %struct.tre_ast_node_t* noundef nonnull %299, i32* noundef null, i32* noundef null, i32* noundef nonnull %4) #7
  %318 = icmp eq i32 %317, 0
  br i1 %318, label %319, label %392

319:                                              ; preds = %316
  %320 = load i32, i32* %4, align 4, !tbaa !9
  %321 = add nsw i32 %320, 1
  %322 = sext i32 %321 to i64
  %323 = shl nsw i64 %322, 2
  %324 = call i8* @malloc(i64 noundef %323) #6
  %325 = bitcast i8* %324 to i32*
  %326 = icmp eq i8* %324, null
  br i1 %326, label %392, label %327

327:                                              ; preds = %319
  store i32 -1, i32* %325, align 4, !tbaa !9
  store i32 0, i32* %5, align 4, !tbaa !9
  %328 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %298, align 8, !tbaa !42
  %329 = call fastcc i32 @tre_match_empty(%struct.tre_stack_rec* noundef nonnull %1, %struct.tre_ast_node_t* noundef %328, i32* noundef nonnull %325, i32* noundef nonnull %5, i32* noundef null) #7
  %330 = icmp eq i32 %329, 0
  br i1 %330, label %331, label %389

331:                                              ; preds = %327
  %332 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %297, i64 0, i32 1
  %333 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %332, align 8, !tbaa !40
  %334 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %333, i64 0, i32 6
  %335 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %334, align 8, !tbaa !52
  %336 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %298, align 8, !tbaa !42
  %337 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %336, i64 0, i32 6
  %338 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %337, align 8, !tbaa !52
  %339 = load i32, i32* %5, align 4, !tbaa !9
  %340 = call fastcc %struct.tre_pos_and_tags_t* @tre_set_union(%struct.tre_mem_struct* noundef %0, %struct.tre_pos_and_tags_t* noundef %335, %struct.tre_pos_and_tags_t* noundef %338, i32* noundef nonnull %325, i32 noundef %339) #7
  %341 = getelementptr inbounds i8, i8* %32, i64 32
  %342 = bitcast i8* %341 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* %340, %struct.tre_pos_and_tags_t** %342, align 8, !tbaa !52
  call void @free(i8* noundef nonnull %324) #6
  %343 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %342, align 8, !tbaa !52
  %344 = icmp eq %struct.tre_pos_and_tags_t* %343, null
  br i1 %344, label %392, label %350

345:                                              ; preds = %309
  %346 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %299, i64 0, i32 6
  %347 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %346, align 8, !tbaa !52
  %348 = getelementptr inbounds i8, i8* %32, i64 32
  %349 = bitcast i8* %348 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* %347, %struct.tre_pos_and_tags_t** %349, align 8, !tbaa !52
  br label %350

350:                                              ; preds = %331, %345
  %351 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %297, i64 0, i32 1
  %352 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %351, align 8, !tbaa !40
  %353 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %352, i64 0, i32 2
  %354 = load i32, i32* %353, align 8, !tbaa !78
  %355 = icmp eq i32 %354, 0
  br i1 %355, label %384, label %356

356:                                              ; preds = %350
  %357 = call fastcc i32 @tre_match_empty(%struct.tre_stack_rec* noundef nonnull %1, %struct.tre_ast_node_t* noundef nonnull %352, i32* noundef null, i32* noundef null, i32* noundef nonnull %4) #7
  %358 = icmp eq i32 %357, 0
  br i1 %358, label %359, label %392

359:                                              ; preds = %356
  %360 = load i32, i32* %4, align 4, !tbaa !9
  %361 = add nsw i32 %360, 1
  %362 = sext i32 %361 to i64
  %363 = shl nsw i64 %362, 2
  %364 = call i8* @malloc(i64 noundef %363) #6
  %365 = bitcast i8* %364 to i32*
  %366 = icmp eq i8* %364, null
  br i1 %366, label %392, label %367

367:                                              ; preds = %359
  store i32 -1, i32* %365, align 4, !tbaa !9
  store i32 0, i32* %5, align 4, !tbaa !9
  %368 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %351, align 8, !tbaa !40
  %369 = call fastcc i32 @tre_match_empty(%struct.tre_stack_rec* noundef nonnull %1, %struct.tre_ast_node_t* noundef %368, i32* noundef nonnull %365, i32* noundef nonnull %5, i32* noundef null) #7
  %370 = icmp eq i32 %369, 0
  br i1 %370, label %371, label %389

371:                                              ; preds = %367
  %372 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %298, align 8, !tbaa !42
  %373 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %372, i64 0, i32 7
  %374 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %373, align 8, !tbaa !63
  %375 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %351, align 8, !tbaa !40
  %376 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %375, i64 0, i32 7
  %377 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %376, align 8, !tbaa !63
  %378 = load i32, i32* %5, align 4, !tbaa !9
  %379 = call fastcc %struct.tre_pos_and_tags_t* @tre_set_union(%struct.tre_mem_struct* noundef %0, %struct.tre_pos_and_tags_t* noundef %374, %struct.tre_pos_and_tags_t* noundef %377, i32* noundef nonnull %365, i32 noundef %378) #7
  %380 = getelementptr inbounds i8, i8* %32, i64 40
  %381 = bitcast i8* %380 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* %379, %struct.tre_pos_and_tags_t** %381, align 8, !tbaa !63
  call void @free(i8* noundef nonnull %364) #6
  %382 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %381, align 8, !tbaa !63
  %383 = icmp eq %struct.tre_pos_and_tags_t* %382, null
  br i1 %383, label %392, label %394

384:                                              ; preds = %350
  %385 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %352, i64 0, i32 7
  %386 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %385, align 8, !tbaa !63
  %387 = getelementptr inbounds i8, i8* %32, i64 40
  %388 = bitcast i8* %387 to %struct.tre_pos_and_tags_t**
  store %struct.tre_pos_and_tags_t* %386, %struct.tre_pos_and_tags_t** %388, align 8, !tbaa !63
  br label %394

389:                                              ; preds = %367, %327
  %390 = phi i8* [ %324, %327 ], [ %364, %367 ]
  %391 = phi i32 [ %329, %327 ], [ %369, %367 ]
  call void @free(i8* noundef nonnull %390) #6
  br label %392

392:                                              ; preds = %316, %319, %331, %356, %359, %371, %389
  %393 = phi i32 [ %391, %389 ], [ 12, %371 ], [ 12, %359 ], [ %357, %356 ], [ 12, %331 ], [ 12, %319 ], [ %317, %316 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %20) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %19) #5
  br label %398

394:                                              ; preds = %384, %371
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %20) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %19) #5
  br label %395

395:                                              ; preds = %81, %285, %259, %228, %212, %185, %33, %21, %126, %111, %394
  %396 = load i32, i32* %6, align 4, !tbaa !19
  %397 = icmp sgt i32 %396, %7
  br i1 %397, label %21, label %398

398:                                              ; preds = %395, %185, %179, %176, %167, %164, %161, %212, %206, %203, %194, %191, %188, %228, %221, %218, %215, %259, %106, %111, %126, %246, %14, %123, %78, %50, %392, %11, %3
  %399 = phi i32 [ %12, %11 ], [ %9, %3 ], [ %393, %392 ], [ 12, %50 ], [ 12, %78 ], [ 12, %123 ], [ 0, %14 ], [ 0, %395 ], [ %186, %185 ], [ %183, %179 ], [ %177, %176 ], [ %174, %167 ], [ %165, %164 ], [ %162, %161 ], [ %213, %212 ], [ %210, %206 ], [ %204, %203 ], [ %201, %194 ], [ %192, %191 ], [ %189, %188 ], [ %229, %228 ], [ %226, %221 ], [ %219, %218 ], [ %216, %215 ], [ 12, %259 ], [ 12, %106 ], [ 12, %111 ], [ 12, %126 ], [ 12, %246 ]
  ret i32 %399
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @tre_ast_to_tnfa(%struct.tre_ast_node_t* nocapture noundef readonly %0, %struct.tnfa_transition* noundef %1, i32* noundef %2, i32* noundef %3) unnamed_addr #0 {
  br label %5

5:                                                ; preds = %19, %4
  %6 = phi %struct.tre_ast_node_t* [ %0, %4 ], [ %21, %19 ]
  %7 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %6, i64 0, i32 0
  %8 = load i32, i32* %7, align 8, !tbaa !35
  switch i32 %8, label %58 [
    i32 2, label %40
    i32 3, label %9
    i32 1, label %22
  ]

9:                                                ; preds = %5
  %10 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %6, i64 0, i32 1
  %11 = bitcast i8** %10 to %struct.tre_union_t**
  %12 = load %struct.tre_union_t*, %struct.tre_union_t** %11, align 8, !tbaa !36
  %13 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %12, i64 0, i32 0
  %14 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %13, align 8, !tbaa !42
  %15 = tail call fastcc i32 @tre_ast_to_tnfa(%struct.tre_ast_node_t* noundef %14, %struct.tnfa_transition* noundef %1, i32* noundef %2, i32* noundef %3) #7
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %58

17:                                               ; preds = %9
  %18 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %12, i64 0, i32 1
  br label %19

19:                                               ; preds = %36, %17, %56
  %20 = phi %struct.tre_ast_node_t** [ %18, %17 ], [ %57, %56 ], [ %30, %36 ]
  %21 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %20, align 8, !tbaa !47
  br label %5

22:                                               ; preds = %5
  %23 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %6, i64 0, i32 1
  %24 = bitcast i8** %23 to %struct.tre_catenation_t**
  %25 = load %struct.tre_catenation_t*, %struct.tre_catenation_t** %24, align 8, !tbaa !36
  %26 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %25, i64 0, i32 0
  %27 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %26, align 8, !tbaa !42
  %28 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %27, i64 0, i32 7
  %29 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %28, align 8, !tbaa !63
  %30 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %25, i64 0, i32 1
  %31 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %30, align 8, !tbaa !40
  %32 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %31, i64 0, i32 6
  %33 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %32, align 8, !tbaa !52
  %34 = tail call fastcc i32 @tre_make_trans(%struct.tre_pos_and_tags_t* noundef %29, %struct.tre_pos_and_tags_t* noundef %33, %struct.tnfa_transition* noundef %1, i32* noundef %2, i32* noundef %3) #7
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %58

36:                                               ; preds = %22
  %37 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %26, align 8, !tbaa !42
  %38 = tail call fastcc i32 @tre_ast_to_tnfa(%struct.tre_ast_node_t* noundef %37, %struct.tnfa_transition* noundef %1, i32* noundef %2, i32* noundef %3) #7
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %19, label %58

40:                                               ; preds = %5
  %41 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %6, i64 0, i32 1
  %42 = bitcast i8** %41 to %struct.tre_iteration_t**
  %43 = load %struct.tre_iteration_t*, %struct.tre_iteration_t** %42, align 8, !tbaa !36
  %44 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %43, i64 0, i32 2
  %45 = load i32, i32* %44, align 4, !tbaa !46
  %46 = icmp eq i32 %45, -1
  br i1 %46, label %47, label %56

47:                                               ; preds = %40
  %48 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %43, i64 0, i32 0
  %49 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %48, align 8, !tbaa !43
  %50 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %49, i64 0, i32 7
  %51 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %50, align 8, !tbaa !63
  %52 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %49, i64 0, i32 6
  %53 = load %struct.tre_pos_and_tags_t*, %struct.tre_pos_and_tags_t** %52, align 8, !tbaa !52
  %54 = tail call fastcc i32 @tre_make_trans(%struct.tre_pos_and_tags_t* noundef %51, %struct.tre_pos_and_tags_t* noundef %53, %struct.tnfa_transition* noundef %1, i32* noundef %2, i32* noundef %3) #7
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %58

56:                                               ; preds = %47, %40
  %57 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %43, i64 0, i32 0
  br label %19

58:                                               ; preds = %5, %47, %36, %22, %9
  %59 = phi i32 [ %15, %9 ], [ %34, %22 ], [ %38, %36 ], [ %54, %47 ], [ 0, %5 ]
  ret i32 %59
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__tre_mem_destroy(%struct.tre_mem_struct* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define void @regfree(%struct.re_pattern_buffer* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %0, i64 0, i32 1
  %3 = load i8*, i8** %2, align 8, !tbaa !67
  %4 = icmp eq i8* %3, null
  br i1 %4, label %124, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds i8, i8* %3, i64 8
  %7 = bitcast i8* %6 to i32*
  %8 = load i32, i32* %7, align 8, !tbaa !50
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %37, label %10

10:                                               ; preds = %5
  %11 = bitcast i8* %3 to %struct.tnfa_transition**
  br label %12

12:                                               ; preds = %10, %32
  %13 = phi i64 [ 0, %10 ], [ %33, %32 ]
  %14 = load %struct.tnfa_transition*, %struct.tnfa_transition** %11, align 8, !tbaa !49
  %15 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %14, i64 %13, i32 2
  %16 = load %struct.tnfa_transition*, %struct.tnfa_transition** %15, align 8, !tbaa !56
  %17 = icmp eq %struct.tnfa_transition* %16, null
  br i1 %17, label %32, label %18

18:                                               ; preds = %12
  %19 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %14, i64 %13, i32 4
  %20 = load i32*, i32** %19, align 8, !tbaa !59
  %21 = icmp eq i32* %20, null
  br i1 %21, label %25, label %22

22:                                               ; preds = %18
  %23 = bitcast i32* %20 to i8*
  tail call void @free(i8* noundef nonnull %23) #6
  %24 = load %struct.tnfa_transition*, %struct.tnfa_transition** %11, align 8, !tbaa !49
  br label %25

25:                                               ; preds = %22, %18
  %26 = phi %struct.tnfa_transition* [ %24, %22 ], [ %14, %18 ]
  %27 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %26, i64 %13, i32 7
  %28 = load i64*, i64** %27, align 8, !tbaa !86
  %29 = icmp eq i64* %28, null
  br i1 %29, label %32, label %30

30:                                               ; preds = %25
  %31 = bitcast i64* %28 to i8*
  tail call void @free(i8* noundef nonnull %31) #6
  br label %32

32:                                               ; preds = %12, %30, %25
  %33 = add nuw nsw i64 %13, 1
  %34 = load i32, i32* %7, align 8, !tbaa !50
  %35 = zext i32 %34 to i64
  %36 = icmp ult i64 %33, %35
  br i1 %36, label %12, label %37

37:                                               ; preds = %32, %5
  %38 = bitcast i8* %3 to %struct.tnfa_transition**
  %39 = load %struct.tnfa_transition*, %struct.tnfa_transition** %38, align 8, !tbaa !49
  %40 = icmp eq %struct.tnfa_transition* %39, null
  br i1 %40, label %43, label %41

41:                                               ; preds = %37
  %42 = bitcast %struct.tnfa_transition* %39 to i8*
  tail call void @free(i8* noundef nonnull %42) #6
  br label %43

43:                                               ; preds = %41, %37
  %44 = getelementptr inbounds i8, i8* %3, i64 16
  %45 = bitcast i8* %44 to %struct.tnfa_transition**
  %46 = load %struct.tnfa_transition*, %struct.tnfa_transition** %45, align 8, !tbaa !55
  %47 = icmp eq %struct.tnfa_transition* %46, null
  br i1 %47, label %70, label %48

48:                                               ; preds = %43
  %49 = bitcast %struct.tnfa_transition* %46 to i8*
  %50 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %46, i64 0, i32 2
  %51 = load %struct.tnfa_transition*, %struct.tnfa_transition** %50, align 8, !tbaa !56
  %52 = icmp eq %struct.tnfa_transition* %51, null
  br i1 %52, label %68, label %53

53:                                               ; preds = %48, %60
  %54 = phi %struct.tnfa_transition* [ %61, %60 ], [ %46, %48 ]
  %55 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 4
  %56 = load i32*, i32** %55, align 8, !tbaa !59
  %57 = icmp eq i32* %56, null
  br i1 %57, label %60, label %58

58:                                               ; preds = %53
  %59 = bitcast i32* %56 to i8*
  tail call void @free(i8* noundef nonnull %59) #6
  br label %60

60:                                               ; preds = %53, %58
  %61 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 1
  %62 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 1, i32 2
  %63 = load %struct.tnfa_transition*, %struct.tnfa_transition** %62, align 8, !tbaa !56
  %64 = icmp eq %struct.tnfa_transition* %63, null
  br i1 %64, label %65, label %53

65:                                               ; preds = %60
  %66 = bitcast i8* %44 to i8**
  %67 = load i8*, i8** %66, align 8, !tbaa !55
  br label %68

68:                                               ; preds = %48, %65
  %69 = phi i8* [ %67, %65 ], [ %49, %48 ]
  tail call void @free(i8* noundef %69) #6
  br label %70

70:                                               ; preds = %68, %43
  %71 = getelementptr inbounds i8, i8* %3, i64 32
  %72 = bitcast i8* %71 to %struct.tre_submatch_data**
  %73 = load %struct.tre_submatch_data*, %struct.tre_submatch_data** %72, align 8, !tbaa !34
  %74 = icmp eq %struct.tre_submatch_data* %73, null
  br i1 %74, label %103, label %75

75:                                               ; preds = %70
  %76 = bitcast %struct.tre_submatch_data* %73 to i8*
  %77 = getelementptr inbounds i8, i8* %3, i64 52
  %78 = bitcast i8* %77 to i32*
  %79 = load i32, i32* %78, align 4, !tbaa !30
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %101, label %81

81:                                               ; preds = %75, %96
  %82 = phi i32 [ %92, %96 ], [ %79, %75 ]
  %83 = phi %struct.tre_submatch_data* [ %97, %96 ], [ %73, %75 ]
  %84 = phi i64 [ %93, %96 ], [ 0, %75 ]
  %85 = getelementptr inbounds %struct.tre_submatch_data, %struct.tre_submatch_data* %83, i64 %84, i32 2
  %86 = load i32*, i32** %85, align 8, !tbaa !71
  %87 = icmp eq i32* %86, null
  br i1 %87, label %91, label %88

88:                                               ; preds = %81
  %89 = bitcast i32* %86 to i8*
  tail call void @free(i8* noundef nonnull %89) #6
  %90 = load i32, i32* %78, align 4, !tbaa !30
  br label %91

91:                                               ; preds = %81, %88
  %92 = phi i32 [ %82, %81 ], [ %90, %88 ]
  %93 = add nuw nsw i64 %84, 1
  %94 = zext i32 %92 to i64
  %95 = icmp ult i64 %93, %94
  br i1 %95, label %96, label %98

96:                                               ; preds = %91
  %97 = load %struct.tre_submatch_data*, %struct.tre_submatch_data** %72, align 8, !tbaa !34
  br label %81

98:                                               ; preds = %91
  %99 = bitcast i8* %71 to i8**
  %100 = load i8*, i8** %99, align 8, !tbaa !34
  br label %101

101:                                              ; preds = %75, %98
  %102 = phi i8* [ %100, %98 ], [ %76, %75 ]
  tail call void @free(i8* noundef %102) #6
  br label %103

103:                                              ; preds = %101, %70
  %104 = getelementptr inbounds i8, i8* %3, i64 56
  %105 = bitcast i8* %104 to i32**
  %106 = load i32*, i32** %105, align 8, !tbaa !32
  %107 = icmp eq i32* %106, null
  br i1 %107, label %110, label %108

108:                                              ; preds = %103
  %109 = bitcast i32* %106 to i8*
  tail call void @free(i8* noundef nonnull %109) #6
  br label %110

110:                                              ; preds = %108, %103
  %111 = getelementptr inbounds i8, i8* %3, i64 40
  %112 = bitcast i8* %111 to i8**
  %113 = load i8*, i8** %112, align 8, !tbaa !51
  %114 = icmp eq i8* %113, null
  br i1 %114, label %116, label %115

115:                                              ; preds = %110
  tail call void @free(i8* noundef nonnull %113) #6
  br label %116

116:                                              ; preds = %115, %110
  %117 = getelementptr inbounds i8, i8* %3, i64 64
  %118 = bitcast i8* %117 to i32**
  %119 = load i32*, i32** %118, align 8, !tbaa !33
  %120 = icmp eq i32* %119, null
  br i1 %120, label %123, label %121

121:                                              ; preds = %116
  %122 = bitcast i32* %119 to i8*
  tail call void @free(i8* noundef nonnull %122) #6
  br label %123

123:                                              ; preds = %121, %116
  tail call void @free(i8* noundef nonnull %3) #6
  br label %124

124:                                              ; preds = %1, %123
  ret void
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @parse_atom(%struct.tre_parse_ctx_t* noundef %0, i8* noundef %1) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca [15 x i8], align 1
  %5 = alloca %struct.literals, align 8
  %6 = alloca %struct.neg, align 8
  %7 = alloca i32, align 4
  %8 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 8
  %9 = load i32, i32* %8, align 4, !tbaa !14
  %10 = and i32 %9, 1
  %11 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #5
  %12 = load i8, i8* %1, align 1, !tbaa !16
  %13 = sext i8 %12 to i32
  switch i32 %13, label %477 [
    i32 91, label %14
    i32 92, label %306
    i32 46, label %420
    i32 94, label %445
    i32 36, label %456
    i32 42, label %469
    i32 123, label %469
    i32 43, label %469
    i32 63, label %469
    i32 124, label %471
    i32 0, label %473
  ]

14:                                               ; preds = %2
  %15 = getelementptr inbounds i8, i8* %1, i64 1
  %16 = bitcast %struct.literals* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %16) #5
  %17 = bitcast %struct.neg* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 520, i8* nonnull %17) #5
  %18 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %19 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %18, align 8, !tbaa !10
  %20 = getelementptr inbounds %struct.literals, %struct.literals* %5, i64 0, i32 0
  store %struct.tre_mem_struct* %19, %struct.tre_mem_struct** %20, align 8, !tbaa !87
  %21 = getelementptr inbounds %struct.literals, %struct.literals* %5, i64 0, i32 2
  store i32 0, i32* %21, align 8, !tbaa !89
  %22 = getelementptr inbounds %struct.literals, %struct.literals* %5, i64 0, i32 3
  store i32 32, i32* %22, align 4, !tbaa !90
  %23 = tail call i8* @malloc(i64 noundef 256) #6
  %24 = getelementptr inbounds %struct.literals, %struct.literals* %5, i64 0, i32 1
  %25 = bitcast %struct.tre_literal_t*** %24 to i8**
  store i8* %23, i8** %25, align 8, !tbaa !91
  %26 = icmp eq i8* %23, null
  br i1 %26, label %304, label %27

27:                                               ; preds = %14
  %28 = getelementptr inbounds %struct.neg, %struct.neg* %6, i64 0, i32 1
  store i32 0, i32* %28, align 4, !tbaa !92
  %29 = load i8, i8* %15, align 1, !tbaa !16
  %30 = icmp eq i8 %29, 94
  %31 = zext i1 %30 to i32
  %32 = getelementptr inbounds %struct.neg, %struct.neg* %6, i64 0, i32 0
  store i32 %31, i32* %32, align 8, !tbaa !94
  %33 = zext i1 %30 to i64
  %34 = getelementptr i8, i8* %15, i64 %33
  %35 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %35) #5
  %36 = call i32 @mbtowc(i32* noundef nonnull %3, i8* noundef %34, i64 noundef -1) #6
  %37 = icmp slt i32 %36, 1
  br i1 %37, label %40, label %38

38:                                               ; preds = %27
  %39 = getelementptr inbounds [15 x i8], [15 x i8]* %4, i64 0, i64 0
  br label %45

40:                                               ; preds = %197, %27
  %41 = phi i8* [ %34, %27 ], [ %200, %197 ]
  %42 = load i8, i8* %41, align 1, !tbaa !16
  %43 = icmp eq i8 %42, 0
  %44 = select i1 %43, i32 7, i32 2
  br label %203

45:                                               ; preds = %197, %38
  %46 = phi i32 [ 0, %38 ], [ %198, %197 ]
  %47 = phi i32 [ %31, %38 ], [ %199, %197 ]
  %48 = phi i32 [ %36, %38 ], [ %201, %197 ]
  %49 = phi i8* [ %34, %38 ], [ %200, %197 ]
  %50 = load i8, i8* %49, align 1, !tbaa !16
  %51 = icmp ne i8 %50, 93
  %52 = icmp eq i8* %49, %34
  %53 = or i1 %52, %51
  br i1 %53, label %54, label %205

54:                                               ; preds = %45
  %55 = icmp ne i8 %50, 45
  %56 = or i1 %52, %55
  br i1 %56, label %64, label %57

57:                                               ; preds = %54
  %58 = getelementptr inbounds i8, i8* %49, i64 1
  %59 = load i8, i8* %58, align 1, !tbaa !16
  switch i8 %59, label %203 [
    i8 93, label %91
    i8 45, label %60
  ]

60:                                               ; preds = %57
  %61 = getelementptr inbounds i8, i8* %49, i64 2
  %62 = load i8, i8* %61, align 1, !tbaa !16
  %63 = icmp eq i8 %62, 93
  br i1 %63, label %203, label %91

64:                                               ; preds = %54
  %65 = icmp eq i8 %50, 91
  br i1 %65, label %66, label %91

66:                                               ; preds = %64
  %67 = getelementptr inbounds i8, i8* %49, i64 1
  %68 = load i8, i8* %67, align 1, !tbaa !16
  switch i8 %68, label %91 [
    i8 46, label %203
    i8 61, label %203
    i8 58, label %69
  ]

69:                                               ; preds = %66
  call void @llvm.lifetime.start.p0i8(i64 15, i8* nonnull %39) #5
  %70 = getelementptr inbounds i8, i8* %49, i64 2
  br label %71

71:                                               ; preds = %75, %69
  %72 = phi i64 [ 0, %69 ], [ %76, %75 ]
  %73 = getelementptr inbounds i8, i8* %70, i64 %72
  %74 = load i8, i8* %73, align 1, !tbaa !16
  switch i8 %74, label %75 [
    i8 0, label %90
    i8 58, label %78
  ]

75:                                               ; preds = %71
  %76 = add nuw nsw i64 %72, 1
  %77 = icmp eq i64 %76, 14
  br i1 %77, label %90, label %71

78:                                               ; preds = %71
  %79 = and i64 %72, 4294967295
  %80 = call i8* @memcpy(i8* noundef nonnull %39, i8* noundef nonnull %70, i64 noundef %79) #6
  %81 = getelementptr inbounds [15 x i8], [15 x i8]* %4, i64 0, i64 %79
  store i8 0, i8* %81, align 1, !tbaa !16
  %82 = call i64 @wctype(i8* noundef nonnull %39) #6
  %83 = icmp eq i64 %82, 0
  br i1 %83, label %90, label %84

84:                                               ; preds = %78
  %85 = add nuw i64 %72, 1
  %86 = and i64 %85, 4294967295
  %87 = getelementptr inbounds i8, i8* %70, i64 %86
  %88 = load i8, i8* %87, align 1, !tbaa !16
  %89 = icmp eq i8 %88, 93
  br i1 %89, label %110, label %90

90:                                               ; preds = %84, %78, %75, %71
  call void @llvm.lifetime.end.p0i8(i64 15, i8* nonnull %39) #5
  br label %203

91:                                               ; preds = %66, %64, %60, %57
  %92 = load i32, i32* %3, align 4, !tbaa !9
  %93 = zext i32 %48 to i64
  %94 = getelementptr inbounds i8, i8* %49, i64 %93
  %95 = load i8, i8* %94, align 1, !tbaa !16
  %96 = icmp eq i8 %95, 45
  br i1 %96, label %97, label %120

97:                                               ; preds = %91
  %98 = getelementptr inbounds i8, i8* %94, i64 1
  %99 = load i8, i8* %98, align 1, !tbaa !16
  %100 = icmp eq i8 %99, 93
  br i1 %100, label %120, label %101

101:                                              ; preds = %97
  %102 = call i32 @mbtowc(i32* noundef nonnull %3, i8* noundef nonnull %98, i64 noundef -1) #6
  %103 = load i32, i32* %3, align 4, !tbaa !9
  %104 = icmp slt i32 %102, 1
  %105 = icmp sgt i32 %92, %103
  %106 = select i1 %104, i1 true, i1 %105
  br i1 %106, label %203, label %107

107:                                              ; preds = %101
  %108 = zext i32 %102 to i64
  %109 = getelementptr inbounds i8, i8* %98, i64 %108
  br label %120

110:                                              ; preds = %84
  %111 = add nuw i64 %72, 2
  %112 = and i64 %111, 4294967295
  %113 = getelementptr inbounds i8, i8* %70, i64 %112
  call void @llvm.lifetime.end.p0i8(i64 15, i8* nonnull %39) #5
  br i1 %30, label %114, label %120

114:                                              ; preds = %110
  %115 = icmp sgt i32 %46, 63
  br i1 %115, label %203, label %116

116:                                              ; preds = %114
  %117 = add nsw i32 %46, 1
  store i32 %117, i32* %28, align 4, !tbaa !92
  %118 = sext i32 %46 to i64
  %119 = getelementptr inbounds %struct.neg, %struct.neg* %6, i64 0, i32 2, i64 %118
  store i64 %82, i64* %119, align 8, !tbaa !95
  br label %197

120:                                              ; preds = %110, %107, %97, %91
  %121 = phi i32 [ 0, %110 ], [ %47, %107 ], [ %47, %97 ], [ %47, %91 ]
  %122 = phi i1 [ true, %110 ], [ false, %107 ], [ false, %97 ], [ false, %91 ]
  %123 = phi i32 [ 1114111, %110 ], [ %103, %107 ], [ %92, %97 ], [ %92, %91 ]
  %124 = phi i32 [ 0, %110 ], [ %92, %107 ], [ %92, %97 ], [ %92, %91 ]
  %125 = phi i64 [ %82, %110 ], [ 0, %107 ], [ 0, %97 ], [ 0, %91 ]
  %126 = phi i8* [ %113, %110 ], [ %109, %107 ], [ %94, %97 ], [ %94, %91 ]
  %127 = call fastcc %struct.tre_literal_t* @tre_new_lit(%struct.literals* noundef nonnull %5) #6
  %128 = icmp eq %struct.tre_literal_t* %127, null
  br i1 %128, label %203, label %129

129:                                              ; preds = %120
  %130 = sext i32 %124 to i64
  %131 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %127, i64 0, i32 0
  store i64 %130, i64* %131, align 8, !tbaa !37
  %132 = sext i32 %123 to i64
  %133 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %127, i64 0, i32 1
  store i64 %132, i64* %133, align 8, !tbaa !77
  %134 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %127, i64 0, i32 3
  store i64 %125, i64* %134, align 8, !tbaa !84
  %135 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %127, i64 0, i32 2
  store i32 -1, i32* %135, align 8, !tbaa !39
  %136 = load i32, i32* %8, align 4, !tbaa !14
  %137 = and i32 %136, 2
  %138 = icmp eq i32 %137, 0
  %139 = or i1 %122, %138
  %140 = icmp sgt i32 %124, %123
  %141 = select i1 %139, i1 true, i1 %140
  br i1 %141, label %197, label %142

142:                                              ; preds = %129, %181
  %143 = phi i32 [ %182, %181 ], [ %124, %129 ]
  %144 = call i32 @iswlower(i32 noundef %143) #6
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %161, label %146

146:                                              ; preds = %142
  %147 = call i32 @towupper(i32 noundef %143) #6
  %148 = call i32 @llvm.smax.i32(i32 %143, i32 %123) #8
  %149 = sub i32 1, %143
  %150 = add i32 %149, %148
  %151 = add i32 %150, %147
  br label %152

152:                                              ; preds = %158, %146
  %153 = phi i32 [ %147, %146 ], [ %156, %158 ]
  %154 = phi i32 [ %143, %146 ], [ %155, %158 ]
  %155 = add i32 %154, 1
  %156 = add nsw i32 %153, 1
  %157 = icmp eq i32 %154, %148
  br i1 %157, label %184, label %158

158:                                              ; preds = %152
  %159 = call i32 @towupper(i32 noundef %155) #6
  %160 = icmp eq i32 %159, %156
  br i1 %160, label %152, label %184

161:                                              ; preds = %142
  %162 = call i32 @iswupper(i32 noundef %143) #6
  %163 = icmp eq i32 %162, 0
  br i1 %163, label %179, label %164

164:                                              ; preds = %161
  %165 = call i32 @towlower(i32 noundef %143) #6
  %166 = call i32 @llvm.smax.i32(i32 %143, i32 %123) #8
  %167 = sub i32 1, %143
  %168 = add i32 %167, %166
  %169 = add i32 %168, %165
  br label %170

170:                                              ; preds = %176, %164
  %171 = phi i32 [ %165, %164 ], [ %174, %176 ]
  %172 = phi i32 [ %143, %164 ], [ %173, %176 ]
  %173 = add i32 %172, 1
  %174 = add nsw i32 %171, 1
  %175 = icmp eq i32 %172, %166
  br i1 %175, label %184, label %176

176:                                              ; preds = %170
  %177 = call i32 @towlower(i32 noundef %173) #6
  %178 = icmp eq i32 %177, %174
  br i1 %178, label %170, label %184

179:                                              ; preds = %161
  %180 = add nsw i32 %143, 1
  br label %181

181:                                              ; preds = %190, %179
  %182 = phi i32 [ %187, %190 ], [ %180, %179 ]
  %183 = icmp sgt i32 %182, %123
  br i1 %183, label %197, label %142

184:                                              ; preds = %158, %152, %176, %170
  %185 = phi i32 [ %165, %170 ], [ %165, %176 ], [ %147, %152 ], [ %147, %158 ]
  %186 = phi i32 [ %174, %176 ], [ %169, %170 ], [ %156, %158 ], [ %151, %152 ]
  %187 = phi i32 [ %173, %170 ], [ %173, %176 ], [ %155, %152 ], [ %155, %158 ]
  %188 = call fastcc %struct.tre_literal_t* @tre_new_lit(%struct.literals* noundef nonnull %5) #6
  %189 = icmp eq %struct.tre_literal_t* %188, null
  br i1 %189, label %203, label %190

190:                                              ; preds = %184
  %191 = sext i32 %185 to i64
  %192 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %188, i64 0, i32 0
  store i64 %191, i64* %192, align 8, !tbaa !37
  %193 = add nsw i32 %186, -1
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %188, i64 0, i32 1
  store i64 %194, i64* %195, align 8, !tbaa !77
  %196 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %188, i64 0, i32 2
  store i32 -1, i32* %196, align 8, !tbaa !39
  br label %181

197:                                              ; preds = %181, %129, %116
  %198 = phi i32 [ %117, %116 ], [ %46, %129 ], [ %46, %181 ]
  %199 = phi i32 [ 1, %116 ], [ %121, %129 ], [ %121, %181 ]
  %200 = phi i8* [ %113, %116 ], [ %126, %129 ], [ %126, %181 ]
  %201 = call i32 @mbtowc(i32* noundef nonnull %3, i8* noundef %200, i64 noundef -1) #6
  %202 = icmp slt i32 %201, 1
  br i1 %202, label %40, label %45

203:                                              ; preds = %120, %114, %101, %66, %66, %60, %57, %184, %90, %40
  %204 = phi i32 [ 4, %90 ], [ %44, %40 ], [ 12, %184 ], [ 11, %57 ], [ 11, %60 ], [ 3, %66 ], [ 3, %66 ], [ 11, %101 ], [ 12, %114 ], [ 12, %120 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %35) #5
  br label %296

205:                                              ; preds = %45
  %206 = getelementptr inbounds i8, i8* %49, i64 1
  %207 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 3
  store i8* %206, i8** %207, align 8, !tbaa !18
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %35) #5
  %208 = icmp eq i32 %47, 0
  br i1 %208, label %246, label %209

209:                                              ; preds = %205
  %210 = load i32, i32* %8, align 4, !tbaa !14
  %211 = and i32 %210, 4
  %212 = icmp eq i32 %211, 0
  br i1 %212, label %219, label %213

213:                                              ; preds = %209
  %214 = call fastcc %struct.tre_literal_t* @tre_new_lit(%struct.literals* noundef nonnull %5) #6
  %215 = icmp eq %struct.tre_literal_t* %214, null
  br i1 %215, label %296, label %216

216:                                              ; preds = %213
  %217 = bitcast %struct.tre_literal_t* %214 to <2 x i64>*
  store <2 x i64> <i64 10, i64 10>, <2 x i64>* %217, align 8, !tbaa !95
  %218 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %214, i64 0, i32 2
  store i32 -1, i32* %218, align 8, !tbaa !39
  br label %219

219:                                              ; preds = %216, %209
  %220 = load i8*, i8** %25, align 8, !tbaa !91
  %221 = load i32, i32* %21, align 8, !tbaa !89
  %222 = sext i32 %221 to i64
  call void @qsort(i8* noundef %220, i64 noundef %222, i64 noundef 8, i32 (i8*, i8*)* noundef nonnull @tre_compare_lit) #6
  %223 = call fastcc %struct.tre_literal_t* @tre_new_lit(%struct.literals* noundef nonnull %5) #6
  %224 = icmp eq %struct.tre_literal_t* %223, null
  br i1 %224, label %296, label %225

225:                                              ; preds = %219
  %226 = bitcast %struct.tre_literal_t* %223 to <2 x i64>*
  store <2 x i64> <i64 1114112, i64 1114112>, <2 x i64>* %226, align 8, !tbaa !95
  %227 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %223, i64 0, i32 2
  store i32 -1, i32* %227, align 8, !tbaa !39
  %228 = icmp eq i32 %46, 0
  br i1 %228, label %246, label %229

229:                                              ; preds = %225
  %230 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %18, align 8, !tbaa !10
  %231 = add nsw i32 %46, 1
  %232 = sext i32 %231 to i64
  %233 = shl nsw i64 %232, 3
  %234 = call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %230, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef %233) #6
  %235 = bitcast i8* %234 to i64*
  %236 = icmp eq i8* %234, null
  br i1 %236, label %296, label %237

237:                                              ; preds = %229
  %238 = getelementptr inbounds %struct.neg, %struct.neg* %6, i64 0, i32 2, i64 0
  %239 = bitcast i64* %238 to i8*
  %240 = sext i32 %46 to i64
  %241 = shl nsw i64 %240, 3
  %242 = call i8* @memcpy(i8* noundef nonnull %234, i8* noundef nonnull %239, i64 noundef %241) #6
  %243 = load i32, i32* %28, align 4, !tbaa !92
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds i64, i64* %235, i64 %244
  store i64 0, i64* %245, align 8, !tbaa !95
  br label %246

246:                                              ; preds = %237, %225, %205
  %247 = phi i64* [ %235, %237 ], [ null, %225 ], [ null, %205 ]
  %248 = load i32, i32* %21, align 8, !tbaa !89
  %249 = icmp sgt i32 %248, 0
  br i1 %249, label %250, label %296

250:                                              ; preds = %246
  %251 = load %struct.tre_literal_t**, %struct.tre_literal_t*** %24, align 8, !tbaa !91
  %252 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 6
  %253 = zext i32 %248 to i64
  br label %254

254:                                              ; preds = %291, %250
  %255 = phi i64 [ 0, %250 ], [ %294, %291 ]
  %256 = phi %struct.tre_ast_node_t* [ null, %250 ], [ %293, %291 ]
  %257 = phi i32 [ 0, %250 ], [ %292, %291 ]
  %258 = getelementptr inbounds %struct.tre_literal_t*, %struct.tre_literal_t** %251, i64 %255
  %259 = load %struct.tre_literal_t*, %struct.tre_literal_t** %258, align 8, !tbaa !47
  %260 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %259, i64 0, i32 0
  %261 = load i64, i64* %260, align 8, !tbaa !37
  %262 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %259, i64 0, i32 1
  %263 = load i64, i64* %262, align 8, !tbaa !77
  %264 = trunc i64 %263 to i32
  %265 = load i32, i32* %32, align 8, !tbaa !94
  %266 = icmp eq i32 %265, 0
  br i1 %266, label %280, label %267

267:                                              ; preds = %254
  %268 = trunc i64 %261 to i32
  %269 = icmp slt i32 %257, %268
  br i1 %269, label %274, label %270

270:                                              ; preds = %267
  %271 = add nsw i32 %264, 1
  %272 = icmp slt i32 %271, %257
  %273 = select i1 %272, i32 %257, i32 %271
  br label %291

274:                                              ; preds = %267
  %275 = sext i32 %257 to i64
  store i64 %275, i64* %260, align 8, !tbaa !37
  %276 = shl i64 %261, 32
  %277 = add i64 %276, -4294967296
  %278 = ashr exact i64 %277, 32
  store i64 %278, i64* %262, align 8, !tbaa !77
  %279 = add nsw i32 %264, 1
  br label %280

280:                                              ; preds = %274, %254
  %281 = phi i32 [ %279, %274 ], [ %257, %254 ]
  %282 = load i32, i32* %252, align 4, !tbaa !48
  %283 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %259, i64 0, i32 2
  store i32 %282, i32* %283, align 8, !tbaa !39
  %284 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %259, i64 0, i32 4
  store i64* %247, i64** %284, align 8, !tbaa !85
  %285 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %18, align 8, !tbaa !10
  %286 = bitcast %struct.tre_literal_t* %259 to i8*
  %287 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_node(%struct.tre_mem_struct* noundef %285, i32 noundef 0, i8* noundef %286) #6
  %288 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %18, align 8, !tbaa !10
  %289 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_union(%struct.tre_mem_struct* noundef %288, %struct.tre_ast_node_t* noundef %256, %struct.tre_ast_node_t* noundef %287) #6
  %290 = icmp eq %struct.tre_ast_node_t* %289, null
  br i1 %290, label %296, label %291

291:                                              ; preds = %280, %270
  %292 = phi i32 [ %273, %270 ], [ %281, %280 ]
  %293 = phi %struct.tre_ast_node_t* [ %256, %270 ], [ %289, %280 ]
  %294 = add nuw nsw i64 %255, 1
  %295 = icmp eq i64 %294, %253
  br i1 %295, label %296, label %254

296:                                              ; preds = %291, %280, %246, %229, %219, %213, %203
  %297 = phi %struct.tre_ast_node_t* [ null, %213 ], [ null, %219 ], [ null, %229 ], [ null, %203 ], [ null, %246 ], [ null, %280 ], [ %293, %291 ]
  %298 = phi i32 [ 12, %213 ], [ 12, %219 ], [ 12, %229 ], [ %204, %203 ], [ 0, %246 ], [ 12, %280 ], [ 0, %291 ]
  %299 = load i8*, i8** %25, align 8, !tbaa !91
  call void @free(i8* noundef %299) #6
  %300 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 6
  %301 = load i32, i32* %300, align 4, !tbaa !48
  %302 = add nsw i32 %301, 1
  store i32 %302, i32* %300, align 4, !tbaa !48
  %303 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 2
  store %struct.tre_ast_node_t* %297, %struct.tre_ast_node_t** %303, align 8, !tbaa !17
  br label %304

304:                                              ; preds = %14, %296
  %305 = phi i32 [ %298, %296 ], [ 12, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 520, i8* nonnull %17) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %16) #5
  br label %537

306:                                              ; preds = %2
  %307 = getelementptr inbounds i8, i8* %1, i64 1
  %308 = load i8, i8* %307, align 1, !tbaa !16
  br label %309

309:                                              ; preds = %314, %306
  %310 = phi i64 [ 0, %306 ], [ %315, %314 ]
  %311 = getelementptr inbounds [13 x %struct.anon], [13 x %struct.anon]* @tre_macros, i64 0, i64 %310, i32 0
  %312 = load i8, i8* %311, align 16, !tbaa !96
  %313 = icmp eq i8 %312, %308
  br i1 %313, label %317, label %314

314:                                              ; preds = %309
  %315 = add nuw nsw i64 %310, 1
  %316 = icmp eq i64 %315, 12
  br i1 %316, label %326, label %309

317:                                              ; preds = %309
  %318 = and i64 %310, 4294967295
  %319 = icmp eq i64 %318, 12
  br i1 %319, label %326, label %320

320:                                              ; preds = %317
  %321 = getelementptr inbounds [13 x %struct.anon], [13 x %struct.anon]* @tre_macros, i64 0, i64 %318, i32 1
  %322 = load i8*, i8** %321, align 8, !tbaa !98
  %323 = tail call fastcc i32 @parse_atom(%struct.tre_parse_ctx_t* noundef %0, i8* noundef nonnull %322) #7
  %324 = getelementptr inbounds i8, i8* %1, i64 2
  %325 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 3
  store i8* %324, i8** %325, align 8, !tbaa !18
  br label %537

326:                                              ; preds = %314, %317
  %327 = sext i8 %308 to i32
  switch i32 %327, label %399 [
    i32 0, label %537
    i32 98, label %328
    i32 66, label %332
    i32 60, label %336
    i32 62, label %340
    i32 120, label %344
    i32 123, label %391
    i32 43, label %391
    i32 63, label %391
    i32 124, label %393
  ]

328:                                              ; preds = %326
  %329 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %330 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %329, align 8, !tbaa !10
  %331 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %330, i32 noundef -2, i32 noundef 64, i32 noundef -1) #7
  br label %416

332:                                              ; preds = %326
  %333 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %334 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %333, align 8, !tbaa !10
  %335 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %334, i32 noundef -2, i32 noundef 128, i32 noundef -1) #7
  br label %416

336:                                              ; preds = %326
  %337 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %338 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %337, align 8, !tbaa !10
  %339 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %338, i32 noundef -2, i32 noundef 16, i32 noundef -1) #7
  br label %416

340:                                              ; preds = %326
  %341 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %342 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %341, align 8, !tbaa !10
  %343 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %342, i32 noundef -2, i32 noundef 32, i32 noundef -1) #7
  br label %416

344:                                              ; preds = %326
  %345 = getelementptr inbounds i8, i8* %1, i64 2
  %346 = load i8, i8* %345, align 1, !tbaa !16
  %347 = icmp eq i8 %346, 123
  %348 = getelementptr inbounds i8, i8* %1, i64 3
  %349 = select i1 %347, i8* %348, i8* %345
  %350 = select i1 %347, i64 8, i64 2
  br label %351

351:                                              ; preds = %344, %364
  %352 = phi i64 [ 0, %344 ], [ %368, %364 ]
  %353 = phi i32 [ 0, %344 ], [ %367, %364 ]
  %354 = getelementptr inbounds i8, i8* %349, i64 %352
  %355 = load i8, i8* %354, align 1, !tbaa !16
  %356 = sext i8 %355 to i32
  %357 = add nsw i32 %356, -48
  %358 = icmp ult i32 %357, 10
  br i1 %358, label %364, label %359

359:                                              ; preds = %351
  %360 = or i32 %356, 32
  %361 = add nsw i32 %360, -87
  %362 = add nsw i32 %360, -103
  %363 = icmp ult i32 %362, -6
  br i1 %363, label %372, label %364

364:                                              ; preds = %359, %351
  %365 = phi i32 [ %357, %351 ], [ %361, %359 ]
  %366 = shl nsw i32 %353, 4
  %367 = add nsw i32 %365, %366
  %368 = add nuw nsw i64 %352, 1
  %369 = icmp ult i64 %368, %350
  %370 = icmp slt i32 %367, 1114112
  %371 = select i1 %369, i1 %370, i1 false
  br i1 %371, label %351, label %372

372:                                              ; preds = %359, %364
  %373 = phi i32 [ %353, %359 ], [ %367, %364 ]
  %374 = phi i64 [ %352, %359 ], [ %368, %364 ]
  %375 = and i64 %374, 4294967295
  %376 = getelementptr inbounds i8, i8* %349, i64 %375
  br i1 %347, label %377, label %382

377:                                              ; preds = %372
  %378 = load i8, i8* %376, align 1, !tbaa !16
  %379 = icmp eq i8 %378, 125
  br i1 %379, label %380, label %537

380:                                              ; preds = %377
  %381 = getelementptr inbounds i8, i8* %376, i64 1
  br label %382

382:                                              ; preds = %380, %372
  %383 = phi i8* [ %381, %380 ], [ %376, %372 ]
  %384 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %385 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %384, align 8, !tbaa !10
  %386 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 6
  %387 = load i32, i32* %386, align 4, !tbaa !48
  %388 = add nsw i32 %387, 1
  store i32 %388, i32* %386, align 4, !tbaa !48
  %389 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %385, i32 noundef %373, i32 noundef %373, i32 noundef %387) #7
  %390 = getelementptr inbounds i8, i8* %383, i64 -1
  br label %416

391:                                              ; preds = %326, %326, %326
  %392 = icmp eq i32 %10, 0
  br i1 %392, label %537, label %477

393:                                              ; preds = %326
  %394 = icmp eq i32 %10, 0
  br i1 %394, label %395, label %477

395:                                              ; preds = %393
  %396 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %397 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %396, align 8, !tbaa !10
  %398 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %397, i32 noundef -1, i32 noundef -1, i32 noundef -1) #7
  br label %530

399:                                              ; preds = %326
  %400 = icmp eq i32 %10, 0
  %401 = add nsw i32 %327, -49
  %402 = icmp ult i32 %401, 9
  %403 = select i1 %400, i1 %402, i1 false
  br i1 %403, label %404, label %477

404:                                              ; preds = %399
  %405 = add nsw i32 %327, -48
  %406 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %407 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %406, align 8, !tbaa !10
  %408 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 6
  %409 = load i32, i32* %408, align 4, !tbaa !48
  %410 = add nsw i32 %409, 1
  store i32 %410, i32* %408, align 4, !tbaa !48
  %411 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %407, i32 noundef -4, i32 noundef %405, i32 noundef %409) #7
  %412 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 7
  %413 = load i32, i32* %412, align 8, !tbaa !15
  %414 = icmp slt i32 %405, %413
  %415 = select i1 %414, i32 %413, i32 %405
  store i32 %415, i32* %412, align 8, !tbaa !15
  br label %416

416:                                              ; preds = %404, %382, %340, %336, %332, %328
  %417 = phi %struct.tre_ast_node_t* [ %411, %404 ], [ %389, %382 ], [ %343, %340 ], [ %339, %336 ], [ %335, %332 ], [ %331, %328 ]
  %418 = phi i8* [ %307, %404 ], [ %390, %382 ], [ %307, %340 ], [ %307, %336 ], [ %307, %332 ], [ %307, %328 ]
  %419 = getelementptr inbounds i8, i8* %418, i64 1
  br label %530

420:                                              ; preds = %2
  %421 = and i32 %9, 4
  %422 = icmp eq i32 %421, 0
  %423 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %424 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %423, align 8, !tbaa !10
  %425 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 6
  %426 = load i32, i32* %425, align 4, !tbaa !48
  %427 = add nsw i32 %426, 1
  store i32 %427, i32* %425, align 4, !tbaa !48
  br i1 %422, label %440, label %428

428:                                              ; preds = %420
  %429 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %424, i32 noundef 0, i32 noundef 9, i32 noundef %426) #7
  %430 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %423, align 8, !tbaa !10
  %431 = load i32, i32* %425, align 4, !tbaa !48
  %432 = add nsw i32 %431, 1
  store i32 %432, i32* %425, align 4, !tbaa !48
  %433 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %430, i32 noundef 11, i32 noundef 1114111, i32 noundef %431) #7
  %434 = icmp ne %struct.tre_ast_node_t* %429, null
  %435 = icmp ne %struct.tre_ast_node_t* %433, null
  %436 = select i1 %434, i1 %435, i1 false
  br i1 %436, label %437, label %442

437:                                              ; preds = %428
  %438 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %423, align 8, !tbaa !10
  %439 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_union(%struct.tre_mem_struct* noundef %438, %struct.tre_ast_node_t* noundef nonnull %429, %struct.tre_ast_node_t* noundef nonnull %433) #7
  br label %442

440:                                              ; preds = %420
  %441 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %424, i32 noundef 0, i32 noundef 1114111, i32 noundef %426) #7
  br label %442

442:                                              ; preds = %437, %428, %440
  %443 = phi %struct.tre_ast_node_t* [ %441, %440 ], [ %439, %437 ], [ null, %428 ]
  %444 = getelementptr inbounds i8, i8* %1, i64 1
  br label %530

445:                                              ; preds = %2
  %446 = icmp eq i32 %10, 0
  br i1 %446, label %447, label %451

447:                                              ; preds = %445
  %448 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 4
  %449 = load i8*, i8** %448, align 8, !tbaa !13
  %450 = icmp eq i8* %449, %1
  br i1 %450, label %451, label %477

451:                                              ; preds = %447, %445
  %452 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %453 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %452, align 8, !tbaa !10
  %454 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %453, i32 noundef -2, i32 noundef 1, i32 noundef -1) #7
  %455 = getelementptr inbounds i8, i8* %1, i64 1
  br label %530

456:                                              ; preds = %2
  %457 = icmp eq i32 %10, 0
  br i1 %457, label %458, label %464

458:                                              ; preds = %456
  %459 = getelementptr inbounds i8, i8* %1, i64 1
  %460 = load i8, i8* %459, align 1, !tbaa !16
  switch i8 %460, label %477 [
    i8 0, label %464
    i8 92, label %461
  ]

461:                                              ; preds = %458
  %462 = getelementptr inbounds i8, i8* %1, i64 2
  %463 = load i8, i8* %462, align 1, !tbaa !16
  switch i8 %463, label %477 [
    i8 41, label %464
    i8 124, label %464
  ]

464:                                              ; preds = %461, %461, %458, %456
  %465 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %466 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %465, align 8, !tbaa !10
  %467 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %466, i32 noundef -2, i32 noundef 2, i32 noundef -1) #7
  %468 = getelementptr inbounds i8, i8* %1, i64 1
  br label %530

469:                                              ; preds = %2, %2, %2, %2
  %470 = icmp eq i32 %10, 0
  br i1 %470, label %477, label %537

471:                                              ; preds = %2
  %472 = icmp eq i32 %10, 0
  br i1 %472, label %477, label %473

473:                                              ; preds = %471, %2
  %474 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %475 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %474, align 8, !tbaa !10
  %476 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %475, i32 noundef -1, i32 noundef -1, i32 noundef -1) #7
  br label %530

477:                                              ; preds = %469, %393, %391, %461, %458, %2, %471, %447, %399
  %478 = phi i8* [ %1, %2 ], [ %1, %471 ], [ %1, %447 ], [ %307, %399 ], [ %307, %393 ], [ %307, %391 ], [ %1, %458 ], [ %1, %461 ], [ %1, %469 ]
  %479 = call i32 @mbtowc(i32* noundef nonnull %7, i8* noundef nonnull %478, i64 noundef -1) #6
  %480 = icmp slt i32 %479, 0
  br i1 %480, label %537, label %481

481:                                              ; preds = %477
  %482 = load i32, i32* %8, align 4, !tbaa !14
  %483 = and i32 %482, 2
  %484 = icmp eq i32 %483, 0
  br i1 %484, label %516, label %485

485:                                              ; preds = %481
  %486 = load i32, i32* %7, align 4, !tbaa !9
  %487 = call i32 @iswupper(i32 noundef %486) #6
  %488 = icmp eq i32 %487, 0
  br i1 %488, label %489, label %493

489:                                              ; preds = %485
  %490 = load i32, i32* %7, align 4, !tbaa !9
  %491 = call i32 @iswlower(i32 noundef %490) #6
  %492 = icmp eq i32 %491, 0
  br i1 %492, label %516, label %493

493:                                              ; preds = %489, %485
  %494 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %495 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %494, align 8, !tbaa !10
  %496 = load i32, i32* %7, align 4, !tbaa !9
  %497 = call i32 @towupper(i32 noundef %496) #6
  %498 = load i32, i32* %7, align 4, !tbaa !9
  %499 = call i32 @towupper(i32 noundef %498) #6
  %500 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 6
  %501 = load i32, i32* %500, align 4, !tbaa !48
  %502 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %495, i32 noundef %497, i32 noundef %499, i32 noundef %501) #7
  %503 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %494, align 8, !tbaa !10
  %504 = load i32, i32* %7, align 4, !tbaa !9
  %505 = call i32 @towlower(i32 noundef %504) #6
  %506 = load i32, i32* %7, align 4, !tbaa !9
  %507 = call i32 @towlower(i32 noundef %506) #6
  %508 = load i32, i32* %500, align 4, !tbaa !48
  %509 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %503, i32 noundef %505, i32 noundef %507, i32 noundef %508) #7
  %510 = icmp ne %struct.tre_ast_node_t* %502, null
  %511 = icmp ne %struct.tre_ast_node_t* %509, null
  %512 = select i1 %510, i1 %511, i1 false
  br i1 %512, label %513, label %523

513:                                              ; preds = %493
  %514 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %494, align 8, !tbaa !10
  %515 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_union(%struct.tre_mem_struct* noundef %514, %struct.tre_ast_node_t* noundef nonnull %502, %struct.tre_ast_node_t* noundef nonnull %509) #7
  br label %523

516:                                              ; preds = %489, %481
  %517 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 0
  %518 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %517, align 8, !tbaa !10
  %519 = load i32, i32* %7, align 4, !tbaa !9
  %520 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 6
  %521 = load i32, i32* %520, align 4, !tbaa !48
  %522 = call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %518, i32 noundef %519, i32 noundef %519, i32 noundef %521) #7
  br label %523

523:                                              ; preds = %513, %493, %516
  %524 = phi %struct.tre_ast_node_t* [ %522, %516 ], [ %515, %513 ], [ null, %493 ]
  %525 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 6
  %526 = load i32, i32* %525, align 4, !tbaa !48
  %527 = add nsw i32 %526, 1
  store i32 %527, i32* %525, align 4, !tbaa !48
  %528 = zext i32 %479 to i64
  %529 = getelementptr inbounds i8, i8* %478, i64 %528
  br label %530

530:                                              ; preds = %416, %442, %451, %464, %473, %523, %395
  %531 = phi %struct.tre_ast_node_t* [ %524, %523 ], [ %476, %473 ], [ %467, %464 ], [ %454, %451 ], [ %443, %442 ], [ %417, %416 ], [ %398, %395 ]
  %532 = phi i8* [ %529, %523 ], [ %1, %473 ], [ %468, %464 ], [ %455, %451 ], [ %444, %442 ], [ %419, %416 ], [ %1, %395 ]
  %533 = icmp eq %struct.tre_ast_node_t* %531, null
  br i1 %533, label %537, label %534

534:                                              ; preds = %530
  %535 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 2
  store %struct.tre_ast_node_t* %531, %struct.tre_ast_node_t** %535, align 8, !tbaa !17
  %536 = getelementptr inbounds %struct.tre_parse_ctx_t, %struct.tre_parse_ctx_t* %0, i64 0, i32 3
  store i8* %532, i8** %536, align 8, !tbaa !18
  br label %537

537:                                              ; preds = %469, %391, %530, %477, %377, %326, %534, %320, %304
  %538 = phi i32 [ 0, %534 ], [ %323, %320 ], [ %305, %304 ], [ 5, %326 ], [ 9, %377 ], [ 13, %391 ], [ 13, %469 ], [ 2, %477 ], [ 12, %530 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #5
  ret i32 %538
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.tre_ast_node_t* @tre_ast_new_iter(%struct.tre_mem_struct* noundef %0, %struct.tre_ast_node_t* noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) unnamed_addr #0 {
  %6 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef 24) #6
  %7 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_node(%struct.tre_mem_struct* noundef %0, i32 noundef 2, i8* noundef %6) #7
  %8 = icmp eq %struct.tre_ast_node_t* %7, null
  br i1 %8, label %24, label %9

9:                                                ; preds = %5
  %10 = bitcast i8* %6 to %struct.tre_ast_node_t**
  store %struct.tre_ast_node_t* %1, %struct.tre_ast_node_t** %10, align 8, !tbaa !43
  %11 = getelementptr inbounds i8, i8* %6, i64 8
  %12 = bitcast i8* %11 to i32*
  store i32 %2, i32* %12, align 8, !tbaa !45
  %13 = getelementptr inbounds i8, i8* %6, i64 12
  %14 = bitcast i8* %13 to i32*
  store i32 %3, i32* %14, align 4, !tbaa !46
  %15 = getelementptr inbounds i8, i8* %6, i64 16
  %16 = trunc i32 %4 to i8
  %17 = load i8, i8* %15, align 8
  %18 = and i8 %16, 1
  %19 = and i8 %17, -2
  %20 = or i8 %19, %18
  store i8 %20, i8* %15, align 8
  %21 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %1, i64 0, i32 4
  %22 = load i32, i32* %21, align 8, !tbaa !22
  %23 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %7, i64 0, i32 4
  store i32 %22, i32* %23, align 8, !tbaa !22
  br label %24

24:                                               ; preds = %5, %9
  ret %struct.tre_ast_node_t* %7
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.tre_ast_node_t* @tre_ast_new_union(%struct.tre_mem_struct* noundef %0, %struct.tre_ast_node_t* noundef %1, %struct.tre_ast_node_t* noundef %2) unnamed_addr #0 {
  %4 = icmp eq %struct.tre_ast_node_t* %1, null
  br i1 %4, label %21, label %5

5:                                                ; preds = %3
  %6 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef 16) #6
  %7 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_node(%struct.tre_mem_struct* noundef %0, i32 noundef 3, i8* noundef %6) #7
  %8 = icmp ne %struct.tre_ast_node_t* %7, null
  %9 = icmp ne %struct.tre_ast_node_t* %2, null
  %10 = and i1 %9, %8
  br i1 %10, label %11, label %21

11:                                               ; preds = %5
  %12 = bitcast i8* %6 to %struct.tre_ast_node_t**
  store %struct.tre_ast_node_t* %1, %struct.tre_ast_node_t** %12, align 8, !tbaa !42
  %13 = getelementptr inbounds i8, i8* %6, i64 8
  %14 = bitcast i8* %13 to %struct.tre_ast_node_t**
  store %struct.tre_ast_node_t* %2, %struct.tre_ast_node_t** %14, align 8, !tbaa !40
  %15 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %1, i64 0, i32 4
  %16 = load i32, i32* %15, align 8, !tbaa !22
  %17 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %2, i64 0, i32 4
  %18 = load i32, i32* %17, align 8, !tbaa !22
  %19 = add nsw i32 %18, %16
  %20 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %7, i64 0, i32 4
  store i32 %19, i32* %20, align 8, !tbaa !22
  br label %21

21:                                               ; preds = %5, %3, %11
  %22 = phi %struct.tre_ast_node_t* [ %7, %11 ], [ %2, %3 ], [ null, %5 ]
  ret %struct.tre_ast_node_t* %22
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @tre_stack_push(%struct.tre_stack_rec* nocapture noundef %0, i8* %1) unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %0, i64 0, i32 3
  %4 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %0, i64 0, i32 0
  %5 = load i32, i32* %3, align 4, !tbaa !19
  %6 = load i32, i32* %4, align 8, !tbaa !99
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %11

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %0, i64 0, i32 4
  %10 = load %union.tre_stack_item*, %union.tre_stack_item** %9, align 8, !tbaa !3
  br label %20

11:                                               ; preds = %2
  %12 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %0, i64 0, i32 1
  %13 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %0, i64 0, i32 2
  %14 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %0, i64 0, i32 4
  %15 = bitcast %union.tre_stack_item** %14 to i8**
  %16 = load i32, i32* %12, align 4, !tbaa !100
  %17 = icmp slt i32 %6, %16
  br i1 %17, label %31, label %47

18:                                               ; preds = %44
  %19 = bitcast i8* %42 to %union.tre_stack_item*
  br label %20

20:                                               ; preds = %8, %18
  %21 = phi %union.tre_stack_item* [ %10, %8 ], [ %19, %18 ]
  %22 = phi i32 [ %5, %8 ], [ %45, %18 ]
  %23 = xor i1 %7, true
  %24 = sext i32 %22 to i64
  %25 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %21, i64 %24, i32 0
  store i8* %1, i8** %25, align 8, !tbaa.struct !101
  %26 = load i32, i32* %3, align 4, !tbaa !19
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %3, align 4, !tbaa !19
  br label %47

28:                                               ; preds = %44
  %29 = load i32, i32* %12, align 4, !tbaa !100
  %30 = icmp slt i32 %38, %29
  br i1 %30, label %31, label %47

31:                                               ; preds = %11, %28
  %32 = phi i32 [ %29, %28 ], [ %16, %11 ]
  %33 = phi i1 [ true, %28 ], [ false, %11 ]
  %34 = phi i32 [ %38, %28 ], [ %6, %11 ]
  %35 = load i32, i32* %13, align 8, !tbaa !102
  %36 = add nsw i32 %35, %34
  %37 = icmp sgt i32 %36, %32
  %38 = select i1 %37, i32 %32, i32 %36
  %39 = load i8*, i8** %15, align 8, !tbaa !3
  %40 = sext i32 %38 to i64
  %41 = shl nsw i64 %40, 3
  %42 = tail call i8* @realloc(i8* noundef %39, i64 noundef %41) #6
  %43 = icmp eq i8* %42, null
  br i1 %43, label %47, label %44

44:                                               ; preds = %31
  store i32 %38, i32* %4, align 8, !tbaa !99
  store i8* %42, i8** %15, align 8, !tbaa !3
  %45 = load i32, i32* %3, align 4, !tbaa !19
  %46 = icmp slt i32 %45, %38
  br i1 %46, label %18, label %28

47:                                               ; preds = %28, %31, %11, %20
  %48 = phi i1 [ %23, %20 ], [ false, %11 ], [ %33, %31 ], [ true, %28 ]
  %49 = phi i32 [ 0, %20 ], [ 12, %11 ], [ 12, %31 ], [ 12, %28 ]
  %50 = select i1 %48, i32 0, i32 %49
  ret i32 %50
}

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @mbtowc(i32* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @iswupper(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @iswlower(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @towupper(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @towlower(i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.tre_literal_t* @tre_new_lit(%struct.literals* nocapture noundef %0) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.literals, %struct.literals* %0, i64 0, i32 2
  %3 = load i32, i32* %2, align 8, !tbaa !89
  %4 = getelementptr inbounds %struct.literals, %struct.literals* %0, i64 0, i32 3
  %5 = load i32, i32* %4, align 4, !tbaa !90
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = getelementptr inbounds %struct.literals, %struct.literals* %0, i64 0, i32 1
  %9 = load %struct.tre_literal_t**, %struct.tre_literal_t*** %8, align 8, !tbaa !91
  br label %24

10:                                               ; preds = %1
  %11 = icmp sgt i32 %5, 32767
  br i1 %11, label %35, label %12

12:                                               ; preds = %10
  %13 = shl nsw i32 %5, 1
  store i32 %13, i32* %4, align 4, !tbaa !90
  %14 = getelementptr inbounds %struct.literals, %struct.literals* %0, i64 0, i32 1
  %15 = bitcast %struct.tre_literal_t*** %14 to i8**
  %16 = load i8*, i8** %15, align 8, !tbaa !91
  %17 = sext i32 %13 to i64
  %18 = shl nsw i64 %17, 3
  %19 = tail call i8* @realloc(i8* noundef %16, i64 noundef %18) #6
  %20 = icmp eq i8* %19, null
  br i1 %20, label %35, label %21

21:                                               ; preds = %12
  store i8* %19, i8** %15, align 8, !tbaa !91
  %22 = bitcast i8* %19 to %struct.tre_literal_t**
  %23 = load i32, i32* %2, align 8, !tbaa !89
  br label %24

24:                                               ; preds = %7, %21
  %25 = phi i32 [ %3, %7 ], [ %23, %21 ]
  %26 = phi %struct.tre_literal_t** [ %9, %7 ], [ %22, %21 ]
  %27 = add nsw i32 %25, 1
  store i32 %27, i32* %2, align 8, !tbaa !89
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds %struct.tre_literal_t*, %struct.tre_literal_t** %26, i64 %28
  %30 = getelementptr inbounds %struct.literals, %struct.literals* %0, i64 0, i32 0
  %31 = load %struct.tre_mem_struct*, %struct.tre_mem_struct** %30, align 8, !tbaa !87
  %32 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %31, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef 40) #6
  %33 = bitcast i8* %32 to %struct.tre_literal_t*
  %34 = bitcast %struct.tre_literal_t** %29 to i8**
  store i8* %32, i8** %34, align 8, !tbaa !47
  br label %35

35:                                               ; preds = %12, %10, %24
  %36 = phi %struct.tre_literal_t* [ %33, %24 ], [ null, %10 ], [ null, %12 ]
  ret %struct.tre_literal_t* %36
}

; Function Attrs: optsize
declare void @qsort(i8* noundef, i64 noundef, i64 noundef, i32 (i8*, i8*)* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define internal i32 @tre_compare_lit(i8* nocapture noundef readonly %0, i8* nocapture noundef readonly %1) #3 {
  %3 = bitcast i8* %0 to %struct.tre_literal_t**
  %4 = bitcast i8* %1 to %struct.tre_literal_t**
  %5 = load %struct.tre_literal_t*, %struct.tre_literal_t** %3, align 8, !tbaa !47
  %6 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %5, i64 0, i32 0
  %7 = load i64, i64* %6, align 8, !tbaa !37
  %8 = load %struct.tre_literal_t*, %struct.tre_literal_t** %4, align 8, !tbaa !47
  %9 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %8, i64 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !37
  %11 = sub nsw i64 %7, %10
  %12 = trunc i64 %11 to i32
  ret i32 %12
}

; Function Attrs: optsize
declare hidden i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef, i32 noundef, i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.tre_ast_node_t* @tre_ast_new_node(%struct.tre_mem_struct* noundef %0, i32 noundef %1, i8* noundef %2) unnamed_addr #0 {
  %4 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef 48) #6
  %5 = icmp ne i8* %4, null
  %6 = icmp ne i8* %2, null
  %7 = and i1 %6, %5
  br i1 %7, label %8, label %17

8:                                                ; preds = %3
  %9 = bitcast i8* %4 to %struct.tre_ast_node_t*
  %10 = getelementptr inbounds i8, i8* %4, i64 8
  %11 = bitcast i8* %10 to i8**
  store i8* %2, i8** %11, align 8, !tbaa !36
  %12 = bitcast i8* %4 to i32*
  store i32 %1, i32* %12, align 8, !tbaa !35
  %13 = getelementptr inbounds i8, i8* %4, i64 16
  %14 = bitcast i8* %13 to i32*
  store i32 -1, i32* %14, align 8, !tbaa !78
  %15 = getelementptr inbounds i8, i8* %4, i64 20
  %16 = bitcast i8* %15 to i32*
  store i32 -1, i32* %16, align 4, !tbaa !20
  br label %17

17:                                               ; preds = %3, %8
  %18 = phi %struct.tre_ast_node_t* [ %9, %8 ], [ null, %3 ]
  ret %struct.tre_ast_node_t* %18
}

; Function Attrs: optsize
declare i64 @wctype(i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @tre_add_tag_left(%struct.tre_mem_struct* noundef %0, %struct.tre_ast_node_t* nocapture noundef %1, i32 noundef %2) unnamed_addr #0 {
  %4 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef 16) #6
  %5 = icmp eq i8* %4, null
  br i1 %5, label %27, label %6

6:                                                ; preds = %3
  %7 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %0, i32 noundef -3, i32 noundef %2, i32 noundef -1) #7
  %8 = bitcast i8* %4 to %struct.tre_ast_node_t**
  store %struct.tre_ast_node_t* %7, %struct.tre_ast_node_t** %8, align 8, !tbaa !42
  %9 = icmp eq %struct.tre_ast_node_t* %7, null
  br i1 %9, label %27, label %10

10:                                               ; preds = %6
  %11 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef 48) #6
  %12 = getelementptr inbounds i8, i8* %4, i64 8
  %13 = bitcast i8* %12 to i8**
  store i8* %11, i8** %13, align 8, !tbaa !40
  %14 = icmp eq i8* %11, null
  br i1 %14, label %27, label %15

15:                                               ; preds = %10
  %16 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %1, i64 0, i32 1
  %17 = load i8*, i8** %16, align 8, !tbaa !36
  %18 = getelementptr inbounds i8, i8* %11, i64 8
  %19 = bitcast i8* %18 to i8**
  store i8* %17, i8** %19, align 8, !tbaa !36
  %20 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %1, i64 0, i32 0
  %21 = load i32, i32* %20, align 8, !tbaa !35
  %22 = bitcast i8* %11 to i32*
  store i32 %21, i32* %22, align 8, !tbaa !35
  %23 = getelementptr inbounds i8, i8* %11, i64 16
  %24 = getelementptr inbounds i8, i8* %11, i64 32
  %25 = bitcast i8* %24 to <2 x %struct.tre_pos_and_tags_t*>*
  store <2 x %struct.tre_pos_and_tags_t*> zeroinitializer, <2 x %struct.tre_pos_and_tags_t*>* %25, align 8, !tbaa !47
  %26 = bitcast i8* %23 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 0, i32 0>, <4 x i32>* %26, align 8, !tbaa !9
  store i8* %4, i8** %16, align 8, !tbaa !36
  store i32 1, i32* %20, align 8, !tbaa !35
  br label %27

27:                                               ; preds = %10, %6, %3, %15
  %28 = phi i32 [ 0, %15 ], [ 12, %3 ], [ 12, %6 ], [ 12, %10 ]
  ret i32 %28
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @tre_add_tag_right(%struct.tre_mem_struct* noundef %0, %struct.tre_ast_node_t* nocapture noundef %1, i32 noundef %2) unnamed_addr #0 {
  %4 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef 16) #6
  %5 = icmp eq i8* %4, null
  br i1 %5, label %27, label %6

6:                                                ; preds = %3
  %7 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %0, i32 noundef -3, i32 noundef %2, i32 noundef -1) #7
  %8 = getelementptr inbounds i8, i8* %4, i64 8
  %9 = bitcast i8* %8 to %struct.tre_ast_node_t**
  store %struct.tre_ast_node_t* %7, %struct.tre_ast_node_t** %9, align 8, !tbaa !40
  %10 = icmp eq %struct.tre_ast_node_t* %7, null
  br i1 %10, label %27, label %11

11:                                               ; preds = %6
  %12 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef 48) #6
  %13 = bitcast i8* %4 to i8**
  store i8* %12, i8** %13, align 8, !tbaa !42
  %14 = icmp eq i8* %12, null
  br i1 %14, label %27, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %1, i64 0, i32 1
  %17 = load i8*, i8** %16, align 8, !tbaa !36
  %18 = getelementptr inbounds i8, i8* %12, i64 8
  %19 = bitcast i8* %18 to i8**
  store i8* %17, i8** %19, align 8, !tbaa !36
  %20 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %1, i64 0, i32 0
  %21 = load i32, i32* %20, align 8, !tbaa !35
  %22 = bitcast i8* %12 to i32*
  store i32 %21, i32* %22, align 8, !tbaa !35
  %23 = getelementptr inbounds i8, i8* %12, i64 16
  %24 = getelementptr inbounds i8, i8* %12, i64 32
  %25 = bitcast i8* %24 to <2 x %struct.tre_pos_and_tags_t*>*
  store <2 x %struct.tre_pos_and_tags_t*> zeroinitializer, <2 x %struct.tre_pos_and_tags_t*>* %25, align 8, !tbaa !47
  %26 = bitcast i8* %23 to <4 x i32>*
  store <4 x i32> <i32 -1, i32 -1, i32 0, i32 0>, <4 x i32>* %26, align 8, !tbaa !9
  store i8* %4, i8** %16, align 8, !tbaa !36
  store i32 1, i32* %20, align 8, !tbaa !35
  br label %27

27:                                               ; preds = %11, %6, %3, %15
  %28 = phi i32 [ 0, %15 ], [ 12, %3 ], [ 12, %6 ], [ 12, %11 ]
  ret i32 %28
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @tre_copy_ast(%struct.tre_mem_struct* noundef %0, %struct.tre_stack_rec* noundef %1, %struct.tre_ast_node_t* noundef %2, i32 noundef %3, i32* nocapture noundef %4, i32* nocapture noundef writeonly %5, %struct.tre_ast_node_t** nocapture noundef writeonly %6, i32* nocapture noundef %7) unnamed_addr #0 {
  %9 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %1, i64 0, i32 3
  %10 = load i32, i32* %9, align 4, !tbaa !19
  %11 = bitcast %struct.tre_ast_node_t* %2 to i8*
  %12 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* %11) #6
  %13 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef %1, i8* null) #6
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %211

15:                                               ; preds = %8
  %16 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %1, i64 0, i32 4
  %17 = and i32 %3, 1
  %18 = icmp eq i32 %17, 0
  %19 = and i32 %3, 2
  %20 = icmp ne i32 %19, 0
  br label %21

21:                                               ; preds = %15, %205
  %22 = phi i32 [ 0, %15 ], [ %208, %205 ]
  %23 = phi i32 [ 1, %15 ], [ %207, %205 ]
  %24 = phi %struct.tre_ast_node_t** [ %6, %15 ], [ %206, %205 ]
  %25 = load i32, i32* %9, align 4, !tbaa !19
  %26 = icmp sgt i32 %25, %10
  br i1 %26, label %27, label %211

27:                                               ; preds = %21
  %28 = load %union.tre_stack_item*, %union.tre_stack_item** %16, align 8, !tbaa !3
  %29 = add nsw i32 %25, -1
  store i32 %29, i32* %9, align 4, !tbaa !19
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %28, i64 %30
  %32 = bitcast %union.tre_stack_item* %31 to i32*
  %33 = load i32, i32* %32, align 8, !tbaa !16
  switch i32 %33, label %205 [
    i32 1, label %34
    i32 0, label %40
  ]

34:                                               ; preds = %27
  %35 = add nsw i32 %25, -2
  store i32 %35, i32* %9, align 4, !tbaa !19
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %28, i64 %36, i32 0
  %38 = bitcast i8** %37 to %struct.tre_ast_node_t***
  %39 = load %struct.tre_ast_node_t**, %struct.tre_ast_node_t*** %38, align 8, !tbaa !16
  br label %205

40:                                               ; preds = %27
  %41 = add nsw i32 %25, -2
  store i32 %41, i32* %9, align 4, !tbaa !19
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %28, i64 %42, i32 0
  %44 = load i8*, i8** %43, align 8, !tbaa !16
  %45 = bitcast i8* %44 to i32*
  %46 = load i32, i32* %45, align 8, !tbaa !35
  switch i32 %46, label %205 [
    i32 0, label %47
    i32 3, label %101
    i32 1, label %138
    i32 2, label %176
  ]

47:                                               ; preds = %40
  %48 = getelementptr inbounds i8, i8* %44, i64 8
  %49 = bitcast i8* %48 to %struct.tre_literal_t**
  %50 = load %struct.tre_literal_t*, %struct.tre_literal_t** %49, align 8, !tbaa !36
  %51 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %50, i64 0, i32 2
  %52 = load i32, i32* %51, align 8, !tbaa !39
  %53 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %50, i64 0, i32 0
  %54 = load i64, i64* %53, align 8, !tbaa !37
  %55 = trunc i64 %54 to i32
  %56 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %50, i64 0, i32 1
  %57 = load i64, i64* %56, align 8, !tbaa !77
  %58 = trunc i64 %57 to i32
  %59 = icmp sgt i64 %54, -1
  %60 = icmp eq i64 %54, -4
  %61 = or i1 %59, %60
  br i1 %61, label %62, label %66

62:                                               ; preds = %47
  %63 = load i32, i32* %4, align 4, !tbaa !9
  %64 = add nsw i32 %63, %52
  %65 = add nsw i32 %22, 1
  br label %78

66:                                               ; preds = %47
  %67 = icmp ne i64 %54, -3
  %68 = or i1 %18, %67
  br i1 %68, label %69, label %78

69:                                               ; preds = %66
  %70 = icmp eq i64 %54, -3
  br i1 %70, label %71, label %78

71:                                               ; preds = %69
  %72 = icmp ne i32 %23, 0
  %73 = select i1 %20, i1 %72, i1 false
  br i1 %73, label %74, label %78

74:                                               ; preds = %71
  %75 = shl i64 %57, 32
  %76 = ashr exact i64 %75, 32
  %77 = getelementptr inbounds i32, i32* %5, i64 %76
  store i32 1, i32* %77, align 4, !tbaa !16
  br label %78

78:                                               ; preds = %66, %74, %71, %69, %62
  %79 = phi i32 [ %64, %62 ], [ %52, %74 ], [ %52, %71 ], [ %52, %69 ], [ -1, %66 ]
  %80 = phi i32 [ %55, %62 ], [ -3, %74 ], [ -3, %71 ], [ %55, %69 ], [ -1, %66 ]
  %81 = phi i32 [ %58, %62 ], [ %58, %74 ], [ %58, %71 ], [ %58, %69 ], [ -1, %66 ]
  %82 = phi i32 [ %23, %62 ], [ 0, %74 ], [ %23, %71 ], [ %23, %69 ], [ %23, %66 ]
  %83 = phi i32 [ %65, %62 ], [ %22, %74 ], [ %22, %71 ], [ %22, %69 ], [ %22, %66 ]
  %84 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_literal(%struct.tre_mem_struct* noundef %0, i32 noundef %80, i32 noundef %81, i32 noundef %79) #7
  store %struct.tre_ast_node_t* %84, %struct.tre_ast_node_t** %24, align 8, !tbaa !47
  %85 = icmp eq %struct.tre_ast_node_t* %84, null
  br i1 %85, label %96, label %86

86:                                               ; preds = %78
  %87 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %84, i64 0, i32 1
  %88 = bitcast i8** %87 to %struct.tre_literal_t**
  %89 = load %struct.tre_literal_t*, %struct.tre_literal_t** %88, align 8, !tbaa !36
  %90 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %50, i64 0, i32 3
  %91 = load i64, i64* %90, align 8, !tbaa !84
  %92 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %89, i64 0, i32 3
  store i64 %91, i64* %92, align 8, !tbaa !84
  %93 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %50, i64 0, i32 4
  %94 = load i64*, i64** %93, align 8, !tbaa !85
  %95 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %89, i64 0, i32 4
  store i64* %94, i64** %95, align 8, !tbaa !85
  br label %96

96:                                               ; preds = %78, %86
  %97 = phi i32 [ 0, %86 ], [ 12, %78 ]
  %98 = load i32, i32* %7, align 4, !tbaa !9
  %99 = icmp sgt i32 %79, %98
  br i1 %99, label %100, label %205

100:                                              ; preds = %96
  store i32 %79, i32* %7, align 4, !tbaa !9
  br label %205

101:                                              ; preds = %40
  %102 = getelementptr inbounds i8, i8* %44, i64 8
  %103 = bitcast i8* %102 to %struct.tre_union_t**
  %104 = load %struct.tre_union_t*, %struct.tre_union_t** %103, align 8, !tbaa !36
  %105 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %104, i64 0, i32 0
  %106 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %105, align 8, !tbaa !42
  %107 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %104, i64 0, i32 1
  %108 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %107, align 8, !tbaa !40
  %109 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_union(%struct.tre_mem_struct* noundef %0, %struct.tre_ast_node_t* noundef %106, %struct.tre_ast_node_t* noundef %108) #7
  store %struct.tre_ast_node_t* %109, %struct.tre_ast_node_t** %24, align 8, !tbaa !47
  %110 = icmp eq %struct.tre_ast_node_t* %109, null
  br i1 %110, label %211, label %111

111:                                              ; preds = %101
  %112 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %109, i64 0, i32 1
  %113 = bitcast i8** %112 to %struct.tre_union_t**
  %114 = load %struct.tre_union_t*, %struct.tre_union_t** %113, align 8, !tbaa !36
  %115 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %114, i64 0, i32 0
  %116 = bitcast %struct.tre_ast_node_t** %107 to i8**
  %117 = load i8*, i8** %116, align 8, !tbaa !40
  %118 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* %117) #6
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %120, label %211

120:                                              ; preds = %111
  %121 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* null) #6
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %123, label %211

123:                                              ; preds = %120
  %124 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %114, i64 0, i32 1
  %125 = bitcast %struct.tre_ast_node_t** %124 to i8*
  %126 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* nonnull %125) #6
  %127 = icmp eq i32 %126, 0
  br i1 %127, label %128, label %211

128:                                              ; preds = %123
  %129 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* nonnull inttoptr (i64 1 to i8*)) #6
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %131, label %211

131:                                              ; preds = %128
  %132 = bitcast %struct.tre_union_t* %104 to i8**
  %133 = load i8*, i8** %132, align 8, !tbaa !42
  %134 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* %133) #6
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %136, label %211

136:                                              ; preds = %131
  %137 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* null) #6
  br label %205

138:                                              ; preds = %40
  %139 = getelementptr inbounds i8, i8* %44, i64 8
  %140 = bitcast i8* %139 to %struct.tre_catenation_t**
  %141 = load %struct.tre_catenation_t*, %struct.tre_catenation_t** %140, align 8, !tbaa !36
  %142 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %141, i64 0, i32 0
  %143 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %142, align 8, !tbaa !42
  %144 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %141, i64 0, i32 1
  %145 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %144, align 8, !tbaa !40
  %146 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_catenation(%struct.tre_mem_struct* noundef %0, %struct.tre_ast_node_t* noundef %143, %struct.tre_ast_node_t* noundef %145) #7
  store %struct.tre_ast_node_t* %146, %struct.tre_ast_node_t** %24, align 8, !tbaa !47
  %147 = icmp eq %struct.tre_ast_node_t* %146, null
  br i1 %147, label %211, label %148

148:                                              ; preds = %138
  %149 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %146, i64 0, i32 1
  %150 = bitcast i8** %149 to %struct.tre_catenation_t**
  %151 = load %struct.tre_catenation_t*, %struct.tre_catenation_t** %150, align 8, !tbaa !36
  %152 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %151, i64 0, i32 0
  %153 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %151, i64 0, i32 1
  %154 = bitcast %struct.tre_catenation_t* %151 to <2 x %struct.tre_ast_node_t*>*
  store <2 x %struct.tre_ast_node_t*> zeroinitializer, <2 x %struct.tre_ast_node_t*>* %154, align 8, !tbaa !47
  %155 = bitcast %struct.tre_ast_node_t** %144 to i8**
  %156 = load i8*, i8** %155, align 8, !tbaa !40
  %157 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* %156) #6
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %159, label %211

159:                                              ; preds = %148
  %160 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* null) #6
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %162, label %211

162:                                              ; preds = %159
  %163 = bitcast %struct.tre_ast_node_t** %153 to i8*
  %164 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* nonnull %163) #6
  %165 = icmp eq i32 %164, 0
  br i1 %165, label %166, label %211

166:                                              ; preds = %162
  %167 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* nonnull inttoptr (i64 1 to i8*)) #6
  %168 = icmp eq i32 %167, 0
  br i1 %168, label %169, label %211

169:                                              ; preds = %166
  %170 = bitcast %struct.tre_catenation_t* %141 to i8**
  %171 = load i8*, i8** %170, align 8, !tbaa !42
  %172 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* %171) #6
  %173 = icmp eq i32 %172, 0
  br i1 %173, label %174, label %211

174:                                              ; preds = %169
  %175 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* null) #6
  br label %205

176:                                              ; preds = %40
  %177 = getelementptr inbounds i8, i8* %44, i64 8
  %178 = bitcast i8* %177 to %struct.tre_iteration_t**
  %179 = load %struct.tre_iteration_t*, %struct.tre_iteration_t** %178, align 8, !tbaa !36
  %180 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %179, i64 0, i32 0
  %181 = bitcast %struct.tre_iteration_t* %179 to i8**
  %182 = load i8*, i8** %181, align 8, !tbaa !43
  %183 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* %182) #6
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %211

185:                                              ; preds = %176
  %186 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %1, i8* null) #6
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %188, label %211

188:                                              ; preds = %185
  %189 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %180, align 8, !tbaa !43
  %190 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %179, i64 0, i32 1
  %191 = load i32, i32* %190, align 8, !tbaa !45
  %192 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %179, i64 0, i32 2
  %193 = load i32, i32* %192, align 4, !tbaa !46
  %194 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %179, i64 0, i32 3
  %195 = load i8, i8* %194, align 8
  %196 = and i8 %195, 1
  %197 = zext i8 %196 to i32
  %198 = tail call fastcc %struct.tre_ast_node_t* @tre_ast_new_iter(%struct.tre_mem_struct* noundef %0, %struct.tre_ast_node_t* noundef %189, i32 noundef %191, i32 noundef %193, i32 noundef %197) #7
  store %struct.tre_ast_node_t* %198, %struct.tre_ast_node_t** %24, align 8, !tbaa !47
  %199 = icmp eq %struct.tre_ast_node_t* %198, null
  br i1 %199, label %211, label %200

200:                                              ; preds = %188
  %201 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %198, i64 0, i32 1
  %202 = bitcast i8** %201 to %struct.tre_iteration_t**
  %203 = load %struct.tre_iteration_t*, %struct.tre_iteration_t** %202, align 8, !tbaa !36
  %204 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %203, i64 0, i32 0
  br label %205

205:                                              ; preds = %34, %27, %40, %100, %96, %136, %174, %200
  %206 = phi %struct.tre_ast_node_t** [ %24, %27 ], [ %24, %40 ], [ %39, %34 ], [ %24, %100 ], [ %24, %96 ], [ %115, %136 ], [ %152, %174 ], [ %204, %200 ]
  %207 = phi i32 [ %23, %27 ], [ %23, %40 ], [ %23, %34 ], [ %82, %100 ], [ %82, %96 ], [ %23, %136 ], [ %23, %174 ], [ %23, %200 ]
  %208 = phi i32 [ %22, %27 ], [ %22, %40 ], [ %22, %34 ], [ %83, %100 ], [ %83, %96 ], [ %22, %136 ], [ %22, %174 ], [ %22, %200 ]
  %209 = phi i32 [ 0, %27 ], [ 0, %40 ], [ 0, %34 ], [ %97, %100 ], [ %97, %96 ], [ %137, %136 ], [ %175, %174 ], [ 0, %200 ]
  %210 = icmp eq i32 %209, 0
  br i1 %210, label %21, label %211

211:                                              ; preds = %188, %185, %176, %169, %166, %162, %159, %148, %138, %131, %128, %123, %120, %111, %101, %21, %205, %8
  %212 = phi i32 [ 0, %8 ], [ %22, %188 ], [ %22, %185 ], [ %22, %176 ], [ %22, %169 ], [ %22, %166 ], [ %22, %162 ], [ %22, %159 ], [ %22, %148 ], [ %22, %138 ], [ %22, %131 ], [ %22, %128 ], [ %22, %123 ], [ %22, %120 ], [ %22, %111 ], [ %22, %101 ], [ %208, %205 ], [ %22, %21 ]
  %213 = phi i32 [ %13, %8 ], [ 12, %188 ], [ %186, %185 ], [ %183, %176 ], [ %172, %169 ], [ %167, %166 ], [ %164, %162 ], [ %160, %159 ], [ %157, %148 ], [ 12, %138 ], [ %134, %131 ], [ %129, %128 ], [ %126, %123 ], [ %121, %120 ], [ %118, %111 ], [ 12, %101 ], [ %209, %205 ], [ 0, %21 ]
  %214 = load i32, i32* %4, align 4, !tbaa !9
  %215 = add nsw i32 %214, %212
  store i32 %215, i32* %4, align 4, !tbaa !9
  ret i32 %213
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.tre_pos_and_tags_t* @tre_set_one(%struct.tre_mem_struct* noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i64 noundef %4, i64* noundef %5, i32 noundef %6) unnamed_addr #0 {
  %8 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef 112) #6
  %9 = icmp eq i8* %8, null
  br i1 %9, label %29, label %10

10:                                               ; preds = %7
  %11 = bitcast i8* %8 to %struct.tre_pos_and_tags_t*
  %12 = bitcast i8* %8 to i32*
  store i32 %1, i32* %12, align 8, !tbaa !53
  %13 = getelementptr inbounds i8, i8* %8, i64 4
  %14 = bitcast i8* %13 to i32*
  store i32 %2, i32* %14, align 4, !tbaa !79
  %15 = getelementptr inbounds i8, i8* %8, i64 8
  %16 = bitcast i8* %15 to i32*
  store i32 %3, i32* %16, align 8, !tbaa !80
  %17 = getelementptr inbounds i8, i8* %8, i64 32
  %18 = bitcast i8* %17 to i64*
  store i64 %4, i64* %18, align 8, !tbaa !81
  %19 = getelementptr inbounds i8, i8* %8, i64 40
  %20 = bitcast i8* %19 to i64**
  store i64* %5, i64** %20, align 8, !tbaa !82
  %21 = getelementptr inbounds i8, i8* %8, i64 48
  %22 = bitcast i8* %21 to i32*
  store i32 %6, i32* %22, align 8, !tbaa !83
  %23 = getelementptr inbounds i8, i8* %8, i64 56
  %24 = bitcast i8* %23 to i32*
  store i32 -1, i32* %24, align 8, !tbaa !53
  %25 = getelementptr inbounds i8, i8* %8, i64 60
  %26 = bitcast i8* %25 to i32*
  store i32 -1, i32* %26, align 4, !tbaa !79
  %27 = getelementptr inbounds i8, i8* %8, i64 64
  %28 = bitcast i8* %27 to i32*
  store i32 -1, i32* %28, align 8, !tbaa !80
  br label %29

29:                                               ; preds = %7, %10
  %30 = phi %struct.tre_pos_and_tags_t* [ %11, %10 ], [ null, %7 ]
  ret %struct.tre_pos_and_tags_t* %30
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.tre_pos_and_tags_t* @tre_set_empty(%struct.tre_mem_struct* noundef %0) unnamed_addr #0 {
  %2 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef 56) #6
  %3 = icmp eq i8* %2, null
  br i1 %3, label %11, label %4

4:                                                ; preds = %1
  %5 = bitcast i8* %2 to %struct.tre_pos_and_tags_t*
  %6 = bitcast i8* %2 to i32*
  store i32 -1, i32* %6, align 8, !tbaa !53
  %7 = getelementptr inbounds i8, i8* %2, i64 4
  %8 = bitcast i8* %7 to i32*
  store i32 -1, i32* %8, align 4, !tbaa !79
  %9 = getelementptr inbounds i8, i8* %2, i64 8
  %10 = bitcast i8* %9 to i32*
  store i32 -1, i32* %10, align 8, !tbaa !80
  br label %11

11:                                               ; preds = %1, %4
  %12 = phi %struct.tre_pos_and_tags_t* [ %5, %4 ], [ null, %1 ]
  ret %struct.tre_pos_and_tags_t* %12
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc %struct.tre_pos_and_tags_t* @tre_set_union(%struct.tre_mem_struct* noundef %0, %struct.tre_pos_and_tags_t* nocapture noundef readonly %1, %struct.tre_pos_and_tags_t* nocapture noundef readonly %2, i32* noundef readonly %3, i32 noundef %4) unnamed_addr #0 {
  %6 = icmp eq i32* %3, null
  br i1 %6, label %15, label %7

7:                                                ; preds = %5, %7
  %8 = phi i64 [ %12, %7 ], [ 0, %5 ]
  %9 = getelementptr inbounds i32, i32* %3, i64 %8
  %10 = load i32, i32* %9, align 4, !tbaa !9
  %11 = icmp sgt i32 %10, -1
  %12 = add nuw i64 %8, 1
  br i1 %11, label %7, label %13

13:                                               ; preds = %7
  %14 = trunc i64 %8 to i32
  br label %15

15:                                               ; preds = %13, %5
  %16 = phi i32 [ 0, %5 ], [ %14, %13 ]
  br label %17

17:                                               ; preds = %17, %15
  %18 = phi i64 [ %22, %17 ], [ 0, %15 ]
  %19 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 %18, i32 0
  %20 = load i32, i32* %19, align 8, !tbaa !53
  %21 = icmp sgt i32 %20, -1
  %22 = add nuw i64 %18, 1
  br i1 %21, label %17, label %23

23:                                               ; preds = %17, %23
  %24 = phi i64 [ %28, %23 ], [ 0, %17 ]
  %25 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %2, i64 %24, i32 0
  %26 = load i32, i32* %25, align 8, !tbaa !53
  %27 = icmp sgt i32 %26, -1
  %28 = add nuw i64 %24, 1
  br i1 %27, label %23, label %29

29:                                               ; preds = %23
  %30 = add i64 %18, 1
  %31 = add i64 %30, %24
  %32 = and i64 %31, 4294967295
  %33 = mul nuw nsw i64 %32, 56
  %34 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 1, i64 noundef %33) #6
  %35 = bitcast i8* %34 to %struct.tre_pos_and_tags_t*
  %36 = icmp eq i8* %34, null
  br i1 %36, label %206, label %37

37:                                               ; preds = %29
  %38 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 0, i32 0
  %39 = load i32, i32* %38, align 8, !tbaa !53
  %40 = icmp sgt i32 %39, -1
  br i1 %40, label %41, label %47

41:                                               ; preds = %37
  %42 = add i32 %16, 1
  %43 = icmp eq i32 %16, 0
  %44 = zext i32 %16 to i64
  br label %54

45:                                               ; preds = %129
  %46 = trunc i64 %130 to i32
  br label %47

47:                                               ; preds = %45, %37
  %48 = phi i32 [ 0, %37 ], [ %46, %45 ]
  %49 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %2, i64 0, i32 0
  %50 = load i32, i32* %49, align 8, !tbaa !53
  %51 = icmp sgt i32 %50, -1
  br i1 %51, label %52, label %201

52:                                               ; preds = %47
  %53 = zext i32 %48 to i64
  br label %134

54:                                               ; preds = %41, %129
  %55 = phi i64 [ 0, %41 ], [ %130, %129 ]
  %56 = phi i32 [ %39, %41 ], [ %132, %129 ]
  %57 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %55, i32 0
  store i32 %56, i32* %57, align 8, !tbaa !53
  %58 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 %55, i32 1
  %59 = load i32, i32* %58, align 4, !tbaa !79
  %60 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %55, i32 1
  store i32 %59, i32* %60, align 4, !tbaa !79
  %61 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 %55, i32 2
  %62 = load i32, i32* %61, align 8, !tbaa !80
  %63 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %55, i32 2
  store i32 %62, i32* %63, align 8, !tbaa !80
  %64 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 %55, i32 4
  %65 = load i32, i32* %64, align 8, !tbaa !61
  %66 = or i32 %65, %4
  %67 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %55, i32 4
  store i32 %66, i32* %67, align 8, !tbaa !61
  %68 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 %55, i32 5
  %69 = load i64, i64* %68, align 8, !tbaa !81
  %70 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %55, i32 5
  store i64 %69, i64* %70, align 8, !tbaa !81
  %71 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 %55, i32 6
  %72 = load i64*, i64** %71, align 8, !tbaa !82
  %73 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %55, i32 6
  store i64* %72, i64** %73, align 8, !tbaa !82
  %74 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 %55, i32 7
  %75 = load i32, i32* %74, align 8, !tbaa !83
  %76 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %55, i32 7
  store i32 %75, i32* %76, align 8, !tbaa !83
  %77 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 %55, i32 3
  %78 = load i32*, i32** %77, align 8, !tbaa !60
  %79 = icmp eq i32* %78, null
  %80 = and i1 %6, %79
  br i1 %80, label %82, label %81

81:                                               ; preds = %54
  br i1 %79, label %92, label %84

82:                                               ; preds = %54
  %83 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %55, i32 3
  store i32* null, i32** %83, align 8, !tbaa !60
  br label %129

84:                                               ; preds = %81, %84
  %85 = phi i64 [ %89, %84 ], [ 0, %81 ]
  %86 = getelementptr inbounds i32, i32* %78, i64 %85
  %87 = load i32, i32* %86, align 4, !tbaa !9
  %88 = icmp sgt i32 %87, -1
  %89 = add nuw i64 %85, 1
  br i1 %88, label %84, label %90

90:                                               ; preds = %84
  %91 = trunc i64 %85 to i32
  br label %92

92:                                               ; preds = %90, %81
  %93 = phi i32 [ 0, %81 ], [ %91, %90 ]
  %94 = add i32 %42, %93
  %95 = zext i32 %94 to i64
  %96 = shl nuw nsw i64 %95, 2
  %97 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef %96) #6
  %98 = bitcast i8* %97 to i32*
  %99 = icmp eq i8* %97, null
  br i1 %99, label %206, label %100

100:                                              ; preds = %92
  %101 = icmp eq i32 %93, 0
  br i1 %101, label %105, label %102

102:                                              ; preds = %100
  %103 = load i32*, i32** %77, align 8, !tbaa !60
  %104 = zext i32 %93 to i64
  br label %108

105:                                              ; preds = %108, %100
  br i1 %43, label %123, label %106

106:                                              ; preds = %105
  %107 = zext i32 %93 to i64
  br label %115

108:                                              ; preds = %102, %108
  %109 = phi i64 [ 0, %102 ], [ %113, %108 ]
  %110 = getelementptr inbounds i32, i32* %103, i64 %109
  %111 = load i32, i32* %110, align 4, !tbaa !9
  %112 = getelementptr inbounds i32, i32* %98, i64 %109
  store i32 %111, i32* %112, align 4, !tbaa !9
  %113 = add nuw nsw i64 %109, 1
  %114 = icmp eq i64 %113, %104
  br i1 %114, label %105, label %108

115:                                              ; preds = %106, %115
  %116 = phi i64 [ 0, %106 ], [ %121, %115 ]
  %117 = getelementptr inbounds i32, i32* %3, i64 %116
  %118 = load i32, i32* %117, align 4, !tbaa !9
  %119 = add nuw nsw i64 %116, %107
  %120 = getelementptr inbounds i32, i32* %98, i64 %119
  store i32 %118, i32* %120, align 4, !tbaa !9
  %121 = add nuw nsw i64 %116, 1
  %122 = icmp eq i64 %121, %44
  br i1 %122, label %123, label %115

123:                                              ; preds = %115, %105
  %124 = add nuw nsw i32 %16, %93
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32* %98, i64 %125
  store i32 -1, i32* %126, align 4, !tbaa !9
  %127 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %55, i32 3
  %128 = bitcast i32** %127 to i8**
  store i8* %97, i8** %128, align 8, !tbaa !60
  br label %129

129:                                              ; preds = %82, %123
  %130 = add nuw i64 %55, 1
  %131 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 %130, i32 0
  %132 = load i32, i32* %131, align 8, !tbaa !53
  %133 = icmp sgt i32 %132, -1
  br i1 %133, label %54, label %45

134:                                              ; preds = %52, %194
  %135 = phi i64 [ 0, %52 ], [ %195, %194 ]
  %136 = phi i32 [ %50, %52 ], [ %197, %194 ]
  %137 = add nuw nsw i64 %135, %53
  %138 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %137, i32 0
  store i32 %136, i32* %138, align 8, !tbaa !53
  %139 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %2, i64 %135, i32 1
  %140 = load i32, i32* %139, align 4, !tbaa !79
  %141 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %137, i32 1
  store i32 %140, i32* %141, align 4, !tbaa !79
  %142 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %2, i64 %135, i32 2
  %143 = load i32, i32* %142, align 8, !tbaa !80
  %144 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %137, i32 2
  store i32 %143, i32* %144, align 8, !tbaa !80
  %145 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %2, i64 %135, i32 4
  %146 = load i32, i32* %145, align 8, !tbaa !61
  %147 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %137, i32 4
  store i32 %146, i32* %147, align 8, !tbaa !61
  %148 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %2, i64 %135, i32 5
  %149 = load i64, i64* %148, align 8, !tbaa !81
  %150 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %137, i32 5
  store i64 %149, i64* %150, align 8, !tbaa !81
  %151 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %2, i64 %135, i32 6
  %152 = load i64*, i64** %151, align 8, !tbaa !82
  %153 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %137, i32 6
  store i64* %152, i64** %153, align 8, !tbaa !82
  %154 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %2, i64 %135, i32 7
  %155 = load i32, i32* %154, align 8, !tbaa !83
  %156 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %137, i32 7
  store i32 %155, i32* %156, align 8, !tbaa !83
  %157 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %2, i64 %135, i32 3
  %158 = load i32*, i32** %157, align 8, !tbaa !60
  %159 = icmp eq i32* %158, null
  br i1 %159, label %160, label %162

160:                                              ; preds = %134
  %161 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %137, i32 3
  store i32* null, i32** %161, align 8, !tbaa !60
  br label %194

162:                                              ; preds = %134, %162
  %163 = phi i64 [ %167, %162 ], [ 0, %134 ]
  %164 = getelementptr inbounds i32, i32* %158, i64 %163
  %165 = load i32, i32* %164, align 4, !tbaa !9
  %166 = icmp sgt i32 %165, -1
  %167 = add nuw i64 %163, 1
  br i1 %166, label %162, label %168

168:                                              ; preds = %162
  %169 = shl i64 %163, 2
  %170 = add i64 %169, 4
  %171 = and i64 %170, 17179869180
  %172 = tail call i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* noundef %0, i32 noundef 0, i8* noundef null, i32 noundef 0, i64 noundef %171) #6
  %173 = bitcast i8* %172 to i32*
  %174 = icmp eq i8* %172, null
  br i1 %174, label %206, label %175

175:                                              ; preds = %168
  %176 = trunc i64 %163 to i32
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %188, label %178

178:                                              ; preds = %175
  %179 = load i32*, i32** %157, align 8, !tbaa !60
  %180 = and i64 %163, 4294967295
  br label %181

181:                                              ; preds = %178, %181
  %182 = phi i64 [ 0, %178 ], [ %186, %181 ]
  %183 = getelementptr inbounds i32, i32* %179, i64 %182
  %184 = load i32, i32* %183, align 4, !tbaa !9
  %185 = getelementptr inbounds i32, i32* %173, i64 %182
  store i32 %184, i32* %185, align 4, !tbaa !9
  %186 = add nuw nsw i64 %182, 1
  %187 = icmp eq i64 %186, %180
  br i1 %187, label %188, label %181

188:                                              ; preds = %181, %175
  %189 = phi i64 [ 0, %175 ], [ %163, %181 ]
  %190 = and i64 %189, 4294967295
  %191 = getelementptr inbounds i32, i32* %173, i64 %190
  store i32 -1, i32* %191, align 4, !tbaa !9
  %192 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %137, i32 3
  %193 = bitcast i32** %192 to i8**
  store i8* %172, i8** %193, align 8, !tbaa !60
  br label %194

194:                                              ; preds = %160, %188
  %195 = add nuw i64 %135, 1
  %196 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %2, i64 %195, i32 0
  %197 = load i32, i32* %196, align 8, !tbaa !53
  %198 = icmp sgt i32 %197, -1
  br i1 %198, label %134, label %199

199:                                              ; preds = %194
  %200 = trunc i64 %195 to i32
  br label %201

201:                                              ; preds = %199, %47
  %202 = phi i32 [ 0, %47 ], [ %200, %199 ]
  %203 = add nuw nsw i32 %202, %48
  %204 = zext i32 %203 to i64
  %205 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %35, i64 %204, i32 0
  store i32 -1, i32* %205, align 8, !tbaa !53
  br label %206

206:                                              ; preds = %92, %168, %29, %201
  %207 = phi %struct.tre_pos_and_tags_t* [ %35, %201 ], [ null, %29 ], [ null, %168 ], [ null, %92 ]
  ret %struct.tre_pos_and_tags_t* %207
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @tre_match_empty(%struct.tre_stack_rec* nocapture noundef %0, %struct.tre_ast_node_t* noundef %1, i32* noundef %2, i32* noundef %3, i32* noundef %4) unnamed_addr #0 {
  %6 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %0, i64 0, i32 3
  %7 = load i32, i32* %6, align 4, !tbaa !19
  %8 = icmp eq i32* %4, null
  br i1 %8, label %10, label %9

9:                                                ; preds = %5
  store i32 0, i32* %4, align 4, !tbaa !9
  br label %10

10:                                               ; preds = %9, %5
  %11 = bitcast %struct.tre_ast_node_t* %1 to i8*
  %12 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %0, i8* %11) #6
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %123

14:                                               ; preds = %10
  %15 = getelementptr inbounds %struct.tre_stack_rec, %struct.tre_stack_rec* %0, i64 0, i32 4
  %16 = icmp eq i32* %3, null
  %17 = icmp eq i32* %2, null
  br label %18

18:                                               ; preds = %14, %120
  %19 = load i32, i32* %6, align 4, !tbaa !19
  %20 = icmp sgt i32 %19, %7
  br i1 %20, label %21, label %123

21:                                               ; preds = %18
  %22 = load %union.tre_stack_item*, %union.tre_stack_item** %15, align 8, !tbaa !3
  %23 = add nsw i32 %19, -1
  store i32 %23, i32* %6, align 4, !tbaa !19
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %union.tre_stack_item, %union.tre_stack_item* %22, i64 %24, i32 0
  %26 = load i8*, i8** %25, align 8, !tbaa !16
  %27 = bitcast i8* %26 to i32*
  %28 = load i32, i32* %27, align 8, !tbaa !35
  switch i32 %28, label %120 [
    i32 0, label %29
    i32 3, label %74
    i32 1, label %95
    i32 2, label %108
  ]

29:                                               ; preds = %21
  %30 = getelementptr inbounds i8, i8* %26, i64 8
  %31 = bitcast i8* %30 to %struct.tre_literal_t**
  %32 = load %struct.tre_literal_t*, %struct.tre_literal_t** %31, align 8, !tbaa !36
  %33 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %32, i64 0, i32 0
  %34 = load i64, i64* %33, align 8, !tbaa !37
  switch i64 %34, label %120 [
    i64 -3, label %35
    i64 -2, label %67
  ]

35:                                               ; preds = %29
  %36 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %32, i64 0, i32 1
  %37 = load i64, i64* %36, align 8, !tbaa !77
  %38 = icmp sgt i64 %37, -1
  br i1 %38, label %39, label %120

39:                                               ; preds = %35
  br i1 %17, label %63, label %40

40:                                               ; preds = %39
  %41 = load i32, i32* %2, align 4, !tbaa !9
  %42 = icmp sgt i32 %41, -1
  br i1 %42, label %43, label %55

43:                                               ; preds = %40, %48
  %44 = phi i64 [ %49, %48 ], [ 0, %40 ]
  %45 = phi i32 [ %51, %48 ], [ %41, %40 ]
  %46 = zext i32 %45 to i64
  %47 = icmp eq i64 %37, %46
  br i1 %47, label %63, label %48

48:                                               ; preds = %43
  %49 = add nuw i64 %44, 1
  %50 = getelementptr inbounds i32, i32* %2, i64 %49
  %51 = load i32, i32* %50, align 4, !tbaa !9
  %52 = icmp sgt i32 %51, -1
  br i1 %52, label %43, label %53

53:                                               ; preds = %48
  %54 = trunc i64 %49 to i32
  br label %55

55:                                               ; preds = %53, %40
  %56 = phi i32 [ 0, %40 ], [ %54, %53 ]
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32* %2, i64 %57
  %59 = trunc i64 %37 to i32
  store i32 %59, i32* %58, align 4, !tbaa !9
  %60 = add nuw nsw i32 %56, 1
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32* %2, i64 %61
  store i32 -1, i32* %62, align 4, !tbaa !9
  br label %63

63:                                               ; preds = %43, %55, %39
  br i1 %8, label %120, label %64

64:                                               ; preds = %63
  %65 = load i32, i32* %4, align 4, !tbaa !9
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %4, align 4, !tbaa !9
  br label %120

67:                                               ; preds = %29
  br i1 %16, label %120, label %68

68:                                               ; preds = %67
  %69 = getelementptr inbounds %struct.tre_literal_t, %struct.tre_literal_t* %32, i64 0, i32 1
  %70 = load i64, i64* %69, align 8, !tbaa !77
  %71 = load i32, i32* %3, align 4, !tbaa !9
  %72 = trunc i64 %70 to i32
  %73 = or i32 %71, %72
  store i32 %73, i32* %3, align 4, !tbaa !9
  br label %120

74:                                               ; preds = %21
  %75 = getelementptr inbounds i8, i8* %26, i64 8
  %76 = bitcast i8* %75 to %struct.tre_union_t**
  %77 = load %struct.tre_union_t*, %struct.tre_union_t** %76, align 8, !tbaa !36
  %78 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %77, i64 0, i32 0
  %79 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %78, align 8, !tbaa !42
  %80 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %79, i64 0, i32 2
  %81 = load i32, i32* %80, align 8, !tbaa !78
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %86, label %83

83:                                               ; preds = %74
  %84 = bitcast %struct.tre_ast_node_t* %79 to i8*
  %85 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %0, i8* %84) #6
  br label %120

86:                                               ; preds = %74
  %87 = getelementptr inbounds %struct.tre_union_t, %struct.tre_union_t* %77, i64 0, i32 1
  %88 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %87, align 8, !tbaa !40
  %89 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %88, i64 0, i32 2
  %90 = load i32, i32* %89, align 8, !tbaa !78
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %120, label %92

92:                                               ; preds = %86
  %93 = bitcast %struct.tre_ast_node_t* %88 to i8*
  %94 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %0, i8* %93) #6
  br label %120

95:                                               ; preds = %21
  %96 = getelementptr inbounds i8, i8* %26, i64 8
  %97 = bitcast i8* %96 to %struct.tre_catenation_t**
  %98 = load %struct.tre_catenation_t*, %struct.tre_catenation_t** %97, align 8, !tbaa !36
  %99 = bitcast %struct.tre_catenation_t* %98 to i8**
  %100 = load i8*, i8** %99, align 8, !tbaa !42
  %101 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %0, i8* %100) #6
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %123

103:                                              ; preds = %95
  %104 = getelementptr inbounds %struct.tre_catenation_t, %struct.tre_catenation_t* %98, i64 0, i32 1
  %105 = bitcast %struct.tre_ast_node_t** %104 to i8**
  %106 = load i8*, i8** %105, align 8, !tbaa !40
  %107 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %0, i8* %106) #6
  br label %120

108:                                              ; preds = %21
  %109 = getelementptr inbounds i8, i8* %26, i64 8
  %110 = bitcast i8* %109 to %struct.tre_iteration_t**
  %111 = load %struct.tre_iteration_t*, %struct.tre_iteration_t** %110, align 8, !tbaa !36
  %112 = getelementptr inbounds %struct.tre_iteration_t, %struct.tre_iteration_t* %111, i64 0, i32 0
  %113 = load %struct.tre_ast_node_t*, %struct.tre_ast_node_t** %112, align 8, !tbaa !43
  %114 = getelementptr inbounds %struct.tre_ast_node_t, %struct.tre_ast_node_t* %113, i64 0, i32 2
  %115 = load i32, i32* %114, align 8, !tbaa !78
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %120, label %117

117:                                              ; preds = %108
  %118 = bitcast %struct.tre_ast_node_t* %113 to i8*
  %119 = tail call fastcc i32 @tre_stack_push(%struct.tre_stack_rec* noundef nonnull %0, i8* %118) #6
  br label %120

120:                                              ; preds = %117, %92, %83, %21, %108, %103, %86, %63, %64, %35, %68, %67, %29
  %121 = phi i32 [ 0, %21 ], [ %119, %117 ], [ 0, %108 ], [ %107, %103 ], [ %85, %83 ], [ %94, %92 ], [ 0, %86 ], [ 0, %29 ], [ 0, %68 ], [ 0, %67 ], [ 0, %64 ], [ 0, %63 ], [ 0, %35 ]
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %18, label %123

123:                                              ; preds = %95, %18, %120, %10
  %124 = phi i32 [ %12, %10 ], [ %101, %95 ], [ %121, %120 ], [ 0, %18 ]
  ret i32 %124
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @tre_make_trans(%struct.tre_pos_and_tags_t* nocapture noundef readonly %0, %struct.tre_pos_and_tags_t* nocapture noundef readonly %1, %struct.tnfa_transition* noundef %2, i32* nocapture noundef %3, i32* nocapture noundef readonly %4) unnamed_addr #0 {
  %6 = icmp eq %struct.tnfa_transition* %2, null
  %7 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %0, i64 0, i32 0
  %8 = load i32, i32* %7, align 8, !tbaa !53
  %9 = icmp sgt i32 %8, -1
  br i1 %6, label %13, label %10

10:                                               ; preds = %5
  br i1 %9, label %11, label %259

11:                                               ; preds = %10
  %12 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 0, i32 0
  br label %18

13:                                               ; preds = %5
  br i1 %9, label %14, label %259

14:                                               ; preds = %13
  %15 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 0, i32 0
  %16 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %1, i64 1
  %17 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %16, i64 0, i32 0
  br label %232

18:                                               ; preds = %11, %228
  %19 = phi i32* [ %7, %11 ], [ %229, %228 ]
  %20 = load i32, i32* %12, align 8, !tbaa !53
  %21 = icmp sgt i32 %20, -1
  br i1 %21, label %22, label %228

22:                                               ; preds = %18
  %23 = getelementptr inbounds i32, i32* %19, i64 1
  %24 = getelementptr inbounds i32, i32* %19, i64 2
  %25 = getelementptr inbounds i32, i32* %19, i64 6
  %26 = getelementptr inbounds i32, i32* %19, i64 8
  %27 = bitcast i32* %26 to i64*
  %28 = getelementptr inbounds i32, i32* %19, i64 10
  %29 = bitcast i32* %28 to i64**
  %30 = getelementptr inbounds i32, i32* %19, i64 12
  %31 = getelementptr inbounds i32, i32* %19, i64 4
  %32 = bitcast i32* %31 to i32**
  br label %33

33:                                               ; preds = %22, %223
  %34 = phi i32 [ %20, %22 ], [ %226, %223 ]
  %35 = phi i32 [ -1, %22 ], [ %38, %223 ]
  %36 = phi %struct.tre_pos_and_tags_t* [ %1, %22 ], [ %224, %223 ]
  br label %37

37:                                               ; preds = %33, %41
  %38 = phi i32 [ %34, %33 ], [ %44, %41 ]
  %39 = phi %struct.tre_pos_and_tags_t* [ %36, %33 ], [ %42, %41 ]
  %40 = icmp eq i32 %38, %35
  br i1 %40, label %41, label %46

41:                                               ; preds = %37
  %42 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %39, i64 1
  %43 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %42, i64 0, i32 0
  %44 = load i32, i32* %43, align 8, !tbaa !53
  %45 = icmp sgt i32 %44, -1
  br i1 %45, label %37, label %228

46:                                               ; preds = %37
  %47 = load i32, i32* %19, align 8, !tbaa !53
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32* %4, i64 %48
  %50 = load i32, i32* %49, align 4, !tbaa !9
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %2, i64 %51
  br label %53

53:                                               ; preds = %53, %46
  %54 = phi %struct.tnfa_transition* [ %52, %46 ], [ %58, %53 ]
  %55 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 2
  %56 = load %struct.tnfa_transition*, %struct.tnfa_transition** %55, align 8, !tbaa !56
  %57 = icmp eq %struct.tnfa_transition* %56, null
  %58 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 1
  br i1 %57, label %59, label %53

59:                                               ; preds = %53
  %60 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 2
  %61 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 1, i32 2
  store %struct.tnfa_transition* null, %struct.tnfa_transition** %61, align 8, !tbaa !56
  %62 = load i32, i32* %23, align 4, !tbaa !79
  %63 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 0
  store i32 %62, i32* %63, align 8, !tbaa !103
  %64 = load i32, i32* %24, align 8, !tbaa !80
  %65 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 1
  store i32 %64, i32* %65, align 4, !tbaa !104
  %66 = sext i32 %38 to i64
  %67 = getelementptr inbounds i32, i32* %4, i64 %66
  %68 = load i32, i32* %67, align 4, !tbaa !9
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %2, i64 %69
  store %struct.tnfa_transition* %70, %struct.tnfa_transition** %60, align 8, !tbaa !56
  %71 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 3
  store i32 %38, i32* %71, align 8, !tbaa !58
  %72 = load i32, i32* %25, align 8, !tbaa !61
  %73 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %39, i64 0, i32 4
  %74 = load i32, i32* %73, align 8, !tbaa !61
  %75 = or i32 %74, %72
  %76 = load i64, i64* %27, align 8, !tbaa !81
  %77 = icmp eq i64 %76, 0
  %78 = select i1 %77, i32 0, i32 4
  %79 = or i32 %75, %78
  %80 = load i64*, i64** %29, align 8, !tbaa !82
  %81 = icmp eq i64* %80, null
  %82 = select i1 %81, i32 0, i32 8
  %83 = or i32 %79, %82
  %84 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 5
  store i32 %83, i32* %84, align 8, !tbaa !62
  %85 = load i32, i32* %30, align 8, !tbaa !83
  %86 = icmp sgt i32 %85, -1
  br i1 %86, label %87, label %91

87:                                               ; preds = %59
  %88 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 6
  %89 = bitcast %union.anon* %88 to i32*
  store i32 %85, i32* %89, align 8, !tbaa !16
  %90 = or i32 %83, 256
  store i32 %90, i32* %84, align 8, !tbaa !62
  br label %93

91:                                               ; preds = %59
  %92 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 6, i32 0
  store i64 %76, i64* %92, align 8, !tbaa !16
  br label %93

93:                                               ; preds = %91, %87
  %94 = load i64*, i64** %29, align 8, !tbaa !82
  %95 = icmp eq i64* %94, null
  br i1 %95, label %127, label %96

96:                                               ; preds = %93, %96
  %97 = phi i64 [ %101, %96 ], [ 0, %93 ]
  %98 = getelementptr inbounds i64, i64* %94, i64 %97
  %99 = load i64, i64* %98, align 8, !tbaa !95
  %100 = icmp eq i64 %99, 0
  %101 = add nuw i64 %97, 1
  br i1 %100, label %102, label %96

102:                                              ; preds = %96
  %103 = shl i64 %97, 3
  %104 = add i64 %103, 8
  %105 = and i64 %104, 34359738360
  %106 = tail call i8* @malloc(i64 noundef %105) #6
  %107 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 7
  %108 = bitcast i64** %107 to i8**
  store i8* %106, i8** %108, align 8, !tbaa !86
  %109 = icmp eq i8* %106, null
  %110 = bitcast i8* %106 to i64*
  br i1 %109, label %259, label %111

111:                                              ; preds = %102
  %112 = load i64*, i64** %29, align 8, !tbaa !82
  %113 = load i64, i64* %112, align 8, !tbaa !95
  %114 = icmp eq i64 %113, 0
  br i1 %114, label %123, label %115

115:                                              ; preds = %111, %115
  %116 = phi i64 [ %119, %115 ], [ 0, %111 ]
  %117 = phi i64 [ %121, %115 ], [ %113, %111 ]
  %118 = getelementptr inbounds i64, i64* %110, i64 %116
  store i64 %117, i64* %118, align 8, !tbaa !95
  %119 = add nuw nsw i64 %116, 1
  %120 = getelementptr inbounds i64, i64* %112, i64 %119
  %121 = load i64, i64* %120, align 8, !tbaa !95
  %122 = icmp eq i64 %121, 0
  br i1 %122, label %123, label %115

123:                                              ; preds = %115, %111
  %124 = phi i64 [ 0, %111 ], [ %119, %115 ]
  %125 = and i64 %124, 4294967295
  %126 = getelementptr inbounds i64, i64* %110, i64 %125
  store i64 0, i64* %126, align 8, !tbaa !95
  br label %129

127:                                              ; preds = %93
  %128 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 7
  store i64* null, i64** %128, align 8, !tbaa !86
  br label %129

129:                                              ; preds = %127, %123
  %130 = load i32*, i32** %32, align 8, !tbaa !60
  %131 = icmp eq i32* %130, null
  br i1 %131, label %140, label %132

132:                                              ; preds = %129, %132
  %133 = phi i64 [ %137, %132 ], [ 0, %129 ]
  %134 = getelementptr inbounds i32, i32* %130, i64 %133
  %135 = load i32, i32* %134, align 4, !tbaa !9
  %136 = icmp sgt i32 %135, -1
  %137 = add nuw i64 %133, 1
  br i1 %136, label %132, label %138

138:                                              ; preds = %132
  %139 = trunc i64 %133 to i32
  br label %140

140:                                              ; preds = %138, %129
  %141 = phi i32 [ 0, %129 ], [ %139, %138 ]
  %142 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %39, i64 0, i32 3
  %143 = load i32*, i32** %142, align 8, !tbaa !60
  %144 = icmp eq i32* %143, null
  br i1 %144, label %153, label %145

145:                                              ; preds = %140, %145
  %146 = phi i64 [ %150, %145 ], [ 0, %140 ]
  %147 = getelementptr inbounds i32, i32* %143, i64 %146
  %148 = load i32, i32* %147, align 4, !tbaa !9
  %149 = icmp sgt i32 %148, -1
  %150 = add nuw i64 %146, 1
  br i1 %149, label %145, label %151

151:                                              ; preds = %145
  %152 = trunc i64 %146 to i32
  br label %153

153:                                              ; preds = %151, %140
  %154 = phi i32 [ 0, %140 ], [ %152, %151 ]
  %155 = getelementptr inbounds %struct.tnfa_transition, %struct.tnfa_transition* %54, i64 0, i32 4
  %156 = load i32*, i32** %155, align 8, !tbaa !59
  %157 = icmp eq i32* %156, null
  br i1 %157, label %160, label %158

158:                                              ; preds = %153
  %159 = bitcast i32* %156 to i8*
  tail call void @free(i8* noundef nonnull %159) #6
  br label %160

160:                                              ; preds = %158, %153
  store i32* null, i32** %155, align 8, !tbaa !59
  %161 = add nuw nsw i32 %154, %141
  %162 = icmp eq i32 %161, 0
  br i1 %162, label %223, label %163

163:                                              ; preds = %160
  %164 = add nuw nsw i32 %161, 1
  %165 = zext i32 %164 to i64
  %166 = shl nuw nsw i64 %165, 2
  %167 = tail call i8* @malloc(i64 noundef %166) #6
  %168 = bitcast i32** %155 to i8**
  store i8* %167, i8** %168, align 8, !tbaa !59
  %169 = icmp eq i8* %167, null
  %170 = bitcast i8* %167 to i32*
  br i1 %169, label %259, label %171

171:                                              ; preds = %163
  %172 = load i32*, i32** %32, align 8, !tbaa !60
  %173 = icmp eq i32* %172, null
  br i1 %173, label %187, label %174

174:                                              ; preds = %171
  %175 = load i32, i32* %172, align 4, !tbaa !9
  %176 = icmp sgt i32 %175, -1
  br i1 %176, label %177, label %187

177:                                              ; preds = %174, %177
  %178 = phi i64 [ %181, %177 ], [ 0, %174 ]
  %179 = phi i32 [ %183, %177 ], [ %175, %174 ]
  %180 = getelementptr inbounds i32, i32* %170, i64 %178
  store i32 %179, i32* %180, align 4, !tbaa !9
  %181 = add nuw nsw i64 %178, 1
  %182 = getelementptr inbounds i32, i32* %172, i64 %181
  %183 = load i32, i32* %182, align 4, !tbaa !9
  %184 = icmp sgt i32 %183, -1
  br i1 %184, label %177, label %185

185:                                              ; preds = %177
  %186 = trunc i64 %181 to i32
  br label %187

187:                                              ; preds = %185, %174, %171
  %188 = phi i32 [ 0, %171 ], [ 0, %174 ], [ %186, %185 ]
  %189 = load i32*, i32** %142, align 8, !tbaa !60
  %190 = icmp eq i32* %189, null
  br i1 %190, label %219, label %191

191:                                              ; preds = %187
  %192 = load i32, i32* %189, align 4, !tbaa !9
  %193 = icmp sgt i32 %192, -1
  br i1 %193, label %194, label %219

194:                                              ; preds = %191
  %195 = icmp eq i32 %188, 0
  %196 = zext i32 %188 to i64
  br label %197

197:                                              ; preds = %194, %213
  %198 = phi i64 [ 0, %194 ], [ %215, %213 ]
  %199 = phi i32 [ %192, %194 ], [ %217, %213 ]
  %200 = phi i32 [ %188, %194 ], [ %214, %213 ]
  br i1 %195, label %209, label %203

201:                                              ; preds = %203
  %202 = icmp eq i64 %208, %196
  br i1 %202, label %209, label %203

203:                                              ; preds = %197, %201
  %204 = phi i64 [ %208, %201 ], [ 0, %197 ]
  %205 = getelementptr inbounds i32, i32* %170, i64 %204
  %206 = load i32, i32* %205, align 4, !tbaa !9
  %207 = icmp eq i32 %206, %199
  %208 = add nuw nsw i64 %204, 1
  br i1 %207, label %213, label %201

209:                                              ; preds = %201, %197
  %210 = add nsw i32 %200, 1
  %211 = sext i32 %200 to i64
  %212 = getelementptr inbounds i32, i32* %170, i64 %211
  store i32 %199, i32* %212, align 4, !tbaa !9
  br label %213

213:                                              ; preds = %203, %209
  %214 = phi i32 [ %210, %209 ], [ %200, %203 ]
  %215 = add nuw i64 %198, 1
  %216 = getelementptr inbounds i32, i32* %189, i64 %215
  %217 = load i32, i32* %216, align 4, !tbaa !9
  %218 = icmp sgt i32 %217, -1
  br i1 %218, label %197, label %219

219:                                              ; preds = %213, %191, %187
  %220 = phi i32 [ %188, %187 ], [ %188, %191 ], [ %214, %213 ]
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds i32, i32* %170, i64 %221
  store i32 -1, i32* %222, align 4, !tbaa !9
  br label %223

223:                                              ; preds = %219, %160
  %224 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %39, i64 1
  %225 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %224, i64 0, i32 0
  %226 = load i32, i32* %225, align 8, !tbaa !53
  %227 = icmp sgt i32 %226, -1
  br i1 %227, label %33, label %228

228:                                              ; preds = %223, %41, %18
  %229 = getelementptr inbounds i32, i32* %19, i64 14
  %230 = load i32, i32* %229, align 8, !tbaa !53
  %231 = icmp sgt i32 %230, -1
  br i1 %231, label %18, label %259

232:                                              ; preds = %14, %255
  %233 = phi i32 [ %8, %14 ], [ %257, %255 ]
  %234 = phi i32* [ %7, %14 ], [ %256, %255 ]
  %235 = load i32, i32* %15, align 8, !tbaa !53
  %236 = icmp sgt i32 %235, -1
  br i1 %236, label %237, label %255

237:                                              ; preds = %232
  %238 = sext i32 %233 to i64
  %239 = getelementptr inbounds i32, i32* %3, i64 %238
  %240 = load i32, i32* %239, align 4, !tbaa !9
  %241 = add nsw i32 %240, 1
  store i32 %241, i32* %239, align 4, !tbaa !9
  %242 = load i32, i32* %17, align 8, !tbaa !53
  %243 = icmp sgt i32 %242, -1
  br i1 %243, label %244, label %255

244:                                              ; preds = %237, %244
  %245 = phi %struct.tre_pos_and_tags_t* [ %251, %244 ], [ %16, %237 ]
  %246 = load i32, i32* %234, align 8, !tbaa !53
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds i32, i32* %3, i64 %247
  %249 = load i32, i32* %248, align 4, !tbaa !9
  %250 = add nsw i32 %249, 1
  store i32 %250, i32* %248, align 4, !tbaa !9
  %251 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %245, i64 1
  %252 = getelementptr inbounds %struct.tre_pos_and_tags_t, %struct.tre_pos_and_tags_t* %251, i64 0, i32 0
  %253 = load i32, i32* %252, align 8, !tbaa !53
  %254 = icmp sgt i32 %253, -1
  br i1 %254, label %244, label %255

255:                                              ; preds = %244, %237, %232
  %256 = getelementptr inbounds i32, i32* %234, i64 14
  %257 = load i32, i32* %256, align 8, !tbaa !53
  %258 = icmp sgt i32 %257, -1
  br i1 %258, label %232, label %259

259:                                              ; preds = %228, %163, %102, %255, %10, %13
  %260 = phi i32 [ 0, %13 ], [ 0, %10 ], [ 0, %255 ], [ 12, %102 ], [ 12, %163 ], [ 0, %228 ]
  ret i32 %260
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 16}
!4 = !{!"tre_stack_rec", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !8, i64 16}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!5, !5, i64 0}
!10 = !{!11, !8, i64 0}
!11 = !{!"", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !5, i64 40, !5, i64 44, !5, i64 48, !5, i64 52}
!12 = !{!11, !8, i64 8}
!13 = !{!11, !8, i64 32}
!14 = !{!11, !5, i64 52}
!15 = !{!11, !5, i64 48}
!16 = !{!6, !6, i64 0}
!17 = !{!11, !8, i64 16}
!18 = !{!11, !8, i64 24}
!19 = !{!4, !5, i64 12}
!20 = !{!21, !5, i64 20}
!21 = !{!"", !6, i64 0, !8, i64 8, !5, i64 16, !5, i64 20, !5, i64 24, !5, i64 28, !8, i64 32, !8, i64 40}
!22 = !{!21, !5, i64 24}
!23 = !{!11, !5, i64 40}
!24 = !{!25, !26, i64 0}
!25 = !{!"re_pattern_buffer", !26, i64 0, !8, i64 8, !6, i64 16, !26, i64 48, !6, i64 56}
!26 = !{!"long", !6, i64 0}
!27 = !{!28, !5, i64 92}
!28 = !{!"tnfa", !8, i64 0, !5, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !5, i64 48, !5, i64 52, !8, i64 56, !8, i64 64, !5, i64 72, !5, i64 76, !5, i64 80, !5, i64 84, !5, i64 88, !5, i64 92, !5, i64 96}
!29 = !{!28, !5, i64 96}
!30 = !{!28, !5, i64 52}
!31 = !{!28, !5, i64 72}
!32 = !{!28, !8, i64 56}
!33 = !{!28, !8, i64 64}
!34 = !{!28, !8, i64 32}
!35 = !{!21, !6, i64 0}
!36 = !{!21, !8, i64 8}
!37 = !{!38, !26, i64 0}
!38 = !{!"", !26, i64 0, !26, i64 8, !5, i64 16, !26, i64 24, !8, i64 32}
!39 = !{!38, !5, i64 16}
!40 = !{!41, !8, i64 8}
!41 = !{!"", !8, i64 0, !8, i64 8}
!42 = !{!41, !8, i64 0}
!43 = !{!44, !8, i64 0}
!44 = !{!"", !8, i64 0, !5, i64 8, !5, i64 12, !5, i64 16}
!45 = !{!44, !5, i64 8}
!46 = !{!44, !5, i64 12}
!47 = !{!8, !8, i64 0}
!48 = !{!11, !5, i64 44}
!49 = !{!28, !8, i64 0}
!50 = !{!28, !5, i64 8}
!51 = !{!28, !8, i64 40}
!52 = !{!21, !8, i64 32}
!53 = !{!54, !5, i64 0}
!54 = !{!"", !5, i64 0, !5, i64 4, !5, i64 8, !8, i64 16, !5, i64 24, !26, i64 32, !8, i64 40, !5, i64 48}
!55 = !{!28, !8, i64 16}
!56 = !{!57, !8, i64 8}
!57 = !{!"tnfa_transition", !5, i64 0, !5, i64 4, !8, i64 8, !5, i64 16, !8, i64 24, !5, i64 32, !6, i64 40, !8, i64 48}
!58 = !{!57, !5, i64 16}
!59 = !{!57, !8, i64 24}
!60 = !{!54, !8, i64 16}
!61 = !{!54, !5, i64 24}
!62 = !{!57, !5, i64 32}
!63 = !{!21, !8, i64 40}
!64 = !{!28, !8, i64 24}
!65 = !{!28, !5, i64 84}
!66 = !{!28, !5, i64 88}
!67 = !{!25, !8, i64 8}
!68 = !{!28, !5, i64 80}
!69 = !{!70, !5, i64 0}
!70 = !{!"", !5, i64 0, !5, i64 4}
!71 = !{!72, !8, i64 8}
!72 = !{!"tre_submatch_data", !5, i64 0, !5, i64 4, !8, i64 8}
!73 = !{!72, !5, i64 0}
!74 = !{!72, !5, i64 4}
!75 = !{!21, !5, i64 28}
!76 = !{!28, !5, i64 76}
!77 = !{!38, !26, i64 8}
!78 = !{!21, !5, i64 16}
!79 = !{!54, !5, i64 4}
!80 = !{!54, !5, i64 8}
!81 = !{!54, !26, i64 32}
!82 = !{!54, !8, i64 40}
!83 = !{!54, !5, i64 48}
!84 = !{!38, !26, i64 24}
!85 = !{!38, !8, i64 32}
!86 = !{!57, !8, i64 48}
!87 = !{!88, !8, i64 0}
!88 = !{!"literals", !8, i64 0, !8, i64 8, !5, i64 16, !5, i64 20}
!89 = !{!88, !5, i64 16}
!90 = !{!88, !5, i64 20}
!91 = !{!88, !8, i64 8}
!92 = !{!93, !5, i64 4}
!93 = !{!"neg", !5, i64 0, !5, i64 4, !6, i64 8}
!94 = !{!93, !5, i64 0}
!95 = !{!26, !26, i64 0}
!96 = !{!97, !6, i64 0}
!97 = !{!"", !6, i64 0, !8, i64 8}
!98 = !{!97, !8, i64 8}
!99 = !{!4, !5, i64 0}
!100 = !{!4, !5, i64 4}
!101 = !{i64 0, i64 8, !47, i64 0, i64 4, !9}
!102 = !{!4, !5, i64 8}
!103 = !{!57, !5, i64 0}
!104 = !{!57, !5, i64 4}
