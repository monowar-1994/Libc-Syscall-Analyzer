; ModuleID = 'src/string/wcsstr.c'
source_filename = "src/string/wcsstr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i32* @wcsstr(i32* noalias noundef %0, i32* noalias noundef %1) local_unnamed_addr #0 {
  %3 = load i32, i32* %1, align 4, !tbaa !3
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %176, label %5

5:                                                ; preds = %2
  %6 = load i32, i32* %0, align 4, !tbaa !3
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %176, label %8

8:                                                ; preds = %5
  %9 = tail call i32* @wcschr(i32* noundef nonnull %0, i32 noundef %3) #2
  %10 = icmp eq i32* %9, null
  br i1 %10, label %176, label %11

11:                                               ; preds = %8
  %12 = getelementptr inbounds i32, i32* %1, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !3
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %176, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds i32, i32* %9, i64 1
  %17 = load i32, i32* %16, align 4, !tbaa !3
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %176, label %21

19:                                               ; preds = %26
  %20 = icmp ugt i64 %27, 1
  br i1 %20, label %31, label %97

21:                                               ; preds = %15, %26
  %22 = phi i64 [ %27, %26 ], [ 0, %15 ]
  %23 = getelementptr inbounds i32, i32* %9, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !3
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %176, label %26

26:                                               ; preds = %21
  %27 = add i64 %22, 1
  %28 = getelementptr inbounds i32, i32* %1, i64 %27
  %29 = load i32, i32* %28, align 4, !tbaa !3
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %19, label %21

31:                                               ; preds = %19, %61
  %32 = phi i32 [ %63, %61 ], [ %13, %19 ]
  %33 = phi i64 [ %59, %61 ], [ 1, %19 ]
  %34 = phi i64 [ %58, %61 ], [ 1, %19 ]
  %35 = phi i64 [ %57, %61 ], [ 1, %19 ]
  %36 = phi i64 [ %56, %61 ], [ 0, %19 ]
  %37 = phi i64 [ %55, %61 ], [ -1, %19 ]
  %38 = add i64 %37, %35
  %39 = getelementptr inbounds i32, i32* %1, i64 %38
  %40 = load i32, i32* %39, align 4, !tbaa !3
  %41 = icmp eq i32 %40, %32
  br i1 %41, label %42, label %48

42:                                               ; preds = %31
  %43 = icmp eq i64 %35, %34
  br i1 %43, label %44, label %46

44:                                               ; preds = %42
  %45 = add i64 %36, %34
  br label %54

46:                                               ; preds = %42
  %47 = add i64 %35, 1
  br label %54

48:                                               ; preds = %31
  %49 = icmp sgt i32 %40, %32
  br i1 %49, label %50, label %52

50:                                               ; preds = %48
  %51 = sub i64 %33, %37
  br label %54

52:                                               ; preds = %48
  %53 = add i64 %36, 1
  br label %54

54:                                               ; preds = %52, %50, %46, %44
  %55 = phi i64 [ %37, %44 ], [ %37, %46 ], [ %37, %50 ], [ %36, %52 ]
  %56 = phi i64 [ %45, %44 ], [ %36, %46 ], [ %33, %50 ], [ %53, %52 ]
  %57 = phi i64 [ 1, %44 ], [ %47, %46 ], [ 1, %50 ], [ 1, %52 ]
  %58 = phi i64 [ %34, %44 ], [ %34, %46 ], [ %51, %50 ], [ 1, %52 ]
  %59 = add i64 %57, %56
  %60 = icmp ult i64 %59, %27
  br i1 %60, label %61, label %64

61:                                               ; preds = %54
  %62 = getelementptr inbounds i32, i32* %1, i64 %59
  %63 = load i32, i32* %62, align 4, !tbaa !3
  br label %31

64:                                               ; preds = %54, %94
  %65 = phi i32 [ %96, %94 ], [ %13, %54 ]
  %66 = phi i64 [ %92, %94 ], [ 1, %54 ]
  %67 = phi i64 [ %91, %94 ], [ 1, %54 ]
  %68 = phi i64 [ %90, %94 ], [ 1, %54 ]
  %69 = phi i64 [ %89, %94 ], [ 0, %54 ]
  %70 = phi i64 [ %88, %94 ], [ -1, %54 ]
  %71 = add i64 %70, %68
  %72 = getelementptr inbounds i32, i32* %1, i64 %71
  %73 = load i32, i32* %72, align 4, !tbaa !3
  %74 = icmp eq i32 %73, %65
  br i1 %74, label %75, label %81

75:                                               ; preds = %64
  %76 = icmp eq i64 %68, %67
  br i1 %76, label %77, label %79

77:                                               ; preds = %75
  %78 = add i64 %69, %67
  br label %87

79:                                               ; preds = %75
  %80 = add i64 %68, 1
  br label %87

81:                                               ; preds = %64
  %82 = icmp slt i32 %73, %65
  br i1 %82, label %83, label %85

83:                                               ; preds = %81
  %84 = sub i64 %66, %70
  br label %87

85:                                               ; preds = %81
  %86 = add i64 %69, 1
  br label %87

87:                                               ; preds = %85, %83, %79, %77
  %88 = phi i64 [ %70, %77 ], [ %70, %79 ], [ %70, %83 ], [ %69, %85 ]
  %89 = phi i64 [ %78, %77 ], [ %69, %79 ], [ %66, %83 ], [ %86, %85 ]
  %90 = phi i64 [ 1, %77 ], [ %80, %79 ], [ 1, %83 ], [ 1, %85 ]
  %91 = phi i64 [ %67, %77 ], [ %67, %79 ], [ %84, %83 ], [ 1, %85 ]
  %92 = add i64 %90, %89
  %93 = icmp ult i64 %92, %27
  br i1 %93, label %94, label %97

94:                                               ; preds = %87
  %95 = getelementptr inbounds i32, i32* %1, i64 %92
  %96 = load i32, i32* %95, align 4, !tbaa !3
  br label %64

97:                                               ; preds = %87, %19
  %98 = phi i64 [ 1, %19 ], [ %58, %87 ]
  %99 = phi i64 [ -1, %19 ], [ %55, %87 ]
  %100 = phi i64 [ -1, %19 ], [ %88, %87 ]
  %101 = phi i64 [ 1, %19 ], [ %91, %87 ]
  %102 = add i64 %100, 1
  %103 = add i64 %99, 1
  %104 = icmp ugt i64 %102, %103
  %105 = select i1 %104, i64 %101, i64 %98
  %106 = select i1 %104, i64 %100, i64 %99
  %107 = getelementptr inbounds i32, i32* %1, i64 %105
  %108 = add i64 %106, 1
  %109 = tail call i32 @wmemcmp(i32* noundef nonnull %1, i32* noundef nonnull %107, i64 noundef %108) #2
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %116, label %111

111:                                              ; preds = %97
  %112 = sub i64 %22, %106
  %113 = icmp ugt i64 %106, %112
  %114 = select i1 %113, i64 %106, i64 %112
  %115 = add i64 %114, 1
  br label %118

116:                                              ; preds = %97
  %117 = sub i64 %27, %105
  br label %118

118:                                              ; preds = %116, %111
  %119 = phi i64 [ %115, %111 ], [ %105, %116 ]
  %120 = phi i64 [ 0, %111 ], [ %117, %116 ]
  %121 = or i64 %27, 63
  br label %122

122:                                              ; preds = %162, %118
  %123 = phi i32* [ %9, %118 ], [ %142, %162 ]
  %124 = phi i64 [ 0, %118 ], [ %163, %162 ]
  %125 = phi i32* [ %9, %118 ], [ %165, %162 ]
  %126 = ptrtoint i32* %123 to i64
  %127 = ptrtoint i32* %125 to i64
  %128 = sub i64 %126, %127
  %129 = ashr exact i64 %128, 2
  %130 = icmp ult i64 %129, %27
  br i1 %130, label %131, label %141

131:                                              ; preds = %122
  %132 = tail call i32* @wmemchr(i32* noundef %123, i32 noundef 0, i64 noundef %121) #2
  %133 = icmp eq i32* %132, null
  br i1 %133, label %139, label %134

134:                                              ; preds = %131
  %135 = ptrtoint i32* %132 to i64
  %136 = sub i64 %135, %127
  %137 = ashr exact i64 %136, 2
  %138 = icmp ult i64 %137, %27
  br i1 %138, label %176, label %141

139:                                              ; preds = %131
  %140 = getelementptr inbounds i32, i32* %123, i64 %121
  br label %141

141:                                              ; preds = %139, %134, %122
  %142 = phi i32* [ %123, %122 ], [ %132, %134 ], [ %140, %139 ]
  %143 = icmp ugt i64 %108, %124
  %144 = select i1 %143, i64 %108, i64 %124
  %145 = getelementptr inbounds i32, i32* %1, i64 %144
  %146 = load i32, i32* %145, align 4, !tbaa !3
  %147 = icmp eq i32 %146, 0
  br i1 %147, label %148, label %149

148:                                              ; preds = %155, %141
  br label %166

149:                                              ; preds = %141, %155
  %150 = phi i32 [ %158, %155 ], [ %146, %141 ]
  %151 = phi i64 [ %156, %155 ], [ %144, %141 ]
  %152 = getelementptr inbounds i32, i32* %125, i64 %151
  %153 = load i32, i32* %152, align 4, !tbaa !3
  %154 = icmp eq i32 %150, %153
  br i1 %154, label %155, label %160

155:                                              ; preds = %149
  %156 = add i64 %151, 1
  %157 = getelementptr inbounds i32, i32* %1, i64 %156
  %158 = load i32, i32* %157, align 4, !tbaa !3
  %159 = icmp eq i32 %158, 0
  br i1 %159, label %148, label %149

160:                                              ; preds = %149
  %161 = sub i64 %151, %106
  br label %162

162:                                              ; preds = %169, %160
  %163 = phi i64 [ 0, %160 ], [ %120, %169 ]
  %164 = phi i64 [ %161, %160 ], [ %119, %169 ]
  %165 = getelementptr inbounds i32, i32* %125, i64 %164
  br label %122

166:                                              ; preds = %148, %169
  %167 = phi i64 [ %170, %169 ], [ %108, %148 ]
  %168 = icmp ugt i64 %167, %124
  br i1 %168, label %169, label %176

169:                                              ; preds = %166
  %170 = add i64 %167, -1
  %171 = getelementptr inbounds i32, i32* %1, i64 %170
  %172 = load i32, i32* %171, align 4, !tbaa !3
  %173 = getelementptr inbounds i32, i32* %125, i64 %170
  %174 = load i32, i32* %173, align 4, !tbaa !3
  %175 = icmp eq i32 %172, %174
  br i1 %175, label %166, label %162

176:                                              ; preds = %21, %134, %166, %15, %8, %11, %5, %2
  %177 = phi i32* [ %0, %2 ], [ null, %5 ], [ %9, %11 ], [ null, %8 ], [ null, %15 ], [ %125, %166 ], [ null, %134 ], [ null, %21 ]
  ret i32* %177
}

declare i32* @wcschr(i32* noundef, i32 noundef) local_unnamed_addr #1

declare i32 @wmemcmp(i32* noundef, i32* noundef, i64 noundef) local_unnamed_addr #1

declare i32* @wmemchr(i32* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
