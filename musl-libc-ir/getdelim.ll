; ModuleID = 'src/stdio/getdelim.c'
source_filename = "src/stdio/getdelim.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@__getdelim = weak alias i64 (i8**, i64*, i32, %struct._IO_FILE*), i64 (i8**, i64*, i32, %struct._IO_FILE*)* @getdelim

; Function Attrs: nounwind optsize strictfp
define i64 @getdelim(i8** noalias noundef %0, i64* noalias noundef %1, i32 noundef %2, %struct._IO_FILE* noalias noundef %3) #0 {
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 19
  %6 = load volatile i32, i32* %5, align 4, !tbaa !3
  %7 = icmp sgt i32 %6, -1
  br i1 %7, label %8, label %10

8:                                                ; preds = %4
  %9 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %3) #3
  br label %10

10:                                               ; preds = %4, %8
  %11 = phi i32 [ %9, %8 ], [ 0, %4 ]
  %12 = icmp ne i64* %1, null
  %13 = icmp ne i8** %0, null
  %14 = and i1 %13, %12
  br i1 %14, label %27, label %15

15:                                               ; preds = %10
  %16 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 18
  %17 = load i32, i32* %16, align 8, !tbaa !10
  %18 = add nsw i32 %17, -1
  %19 = or i32 %18, %17
  store i32 %19, i32* %16, align 8, !tbaa !10
  %20 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 0
  %21 = load i32, i32* %20, align 8, !tbaa !11
  %22 = or i32 %21, 32
  store i32 %22, i32* %20, align 8, !tbaa !11
  %23 = icmp eq i32 %11, 0
  br i1 %23, label %25, label %24

24:                                               ; preds = %15
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %3) #3
  br label %25

25:                                               ; preds = %24, %15
  %26 = tail call i32* @___errno_location() #4
  store i32 22, i32* %26, align 4, !tbaa !12
  br label %157

27:                                               ; preds = %10
  %28 = load i8*, i8** %0, align 8, !tbaa !13
  %29 = icmp eq i8* %28, null
  br i1 %29, label %30, label %31

30:                                               ; preds = %27
  store i64 0, i64* %1, align 8, !tbaa !14
  br label %31

31:                                               ; preds = %30, %27
  %32 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 1
  %33 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 2
  br label %34

34:                                               ; preds = %149, %31
  %35 = phi i64 [ 0, %31 ], [ %150, %149 ]
  %36 = load i8*, i8** %32, align 8, !tbaa !15
  %37 = load i8*, i8** %33, align 8, !tbaa !16
  %38 = icmp eq i8* %36, %37
  br i1 %38, label %57, label %39

39:                                               ; preds = %34
  %40 = ptrtoint i8* %37 to i64
  %41 = ptrtoint i8* %36 to i64
  %42 = sub i64 %40, %41
  %43 = tail call i8* @memchr(i8* noundef %36, i32 noundef %2, i64 noundef %42) #3
  %44 = icmp eq i8* %43, null
  br i1 %44, label %51, label %45

45:                                               ; preds = %39
  %46 = load i8*, i8** %32, align 8, !tbaa !15
  %47 = ptrtoint i8* %43 to i64
  %48 = ptrtoint i8* %46 to i64
  %49 = add i64 %47, 1
  %50 = sub i64 %49, %48
  br label %57

51:                                               ; preds = %39
  %52 = load i8*, i8** %33, align 8, !tbaa !16
  %53 = load i8*, i8** %32, align 8, !tbaa !15
  %54 = ptrtoint i8* %52 to i64
  %55 = ptrtoint i8* %53 to i64
  %56 = sub i64 %54, %55
  br label %57

57:                                               ; preds = %34, %45, %51
  %58 = phi i8* [ null, %51 ], [ %43, %45 ], [ null, %34 ]
  %59 = phi i64 [ %56, %51 ], [ %50, %45 ], [ 0, %34 ]
  %60 = add i64 %59, %35
  %61 = load i64, i64* %1, align 8, !tbaa !14
  %62 = icmp ult i64 %60, %61
  br i1 %62, label %101, label %63

63:                                               ; preds = %57
  %64 = add i64 %60, 2
  %65 = icmp eq i8* %58, null
  %66 = icmp ult i64 %64, 4611686018427387903
  %67 = select i1 %65, i1 %66, i1 false
  %68 = lshr i64 %64, 1
  %69 = select i1 %67, i64 %68, i64 0
  %70 = add i64 %69, %64
  %71 = load i8*, i8** %0, align 8, !tbaa !13
  %72 = tail call i8* @realloc(i8* noundef %71, i64 noundef %70) #3
  %73 = icmp eq i8* %72, null
  br i1 %73, label %74, label %96

74:                                               ; preds = %63
  %75 = load i8*, i8** %0, align 8, !tbaa !13
  %76 = tail call i8* @realloc(i8* noundef %75, i64 noundef %64) #3
  %77 = icmp eq i8* %76, null
  br i1 %77, label %78, label %96

78:                                               ; preds = %74
  %79 = load i64, i64* %1, align 8, !tbaa !14
  %80 = sub i64 %79, %35
  %81 = load i8*, i8** %0, align 8, !tbaa !13
  %82 = getelementptr inbounds i8, i8* %81, i64 %35
  %83 = load i8*, i8** %32, align 8, !tbaa !15
  %84 = tail call i8* @memcpy(i8* noundef %82, i8* noundef %83, i64 noundef %80) #3
  %85 = load i8*, i8** %32, align 8, !tbaa !15
  %86 = getelementptr inbounds i8, i8* %85, i64 %80
  store i8* %86, i8** %32, align 8, !tbaa !15
  %87 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 18
  %88 = load i32, i32* %87, align 8, !tbaa !10
  %89 = add nsw i32 %88, -1
  %90 = or i32 %89, %88
  store i32 %90, i32* %87, align 8, !tbaa !10
  %91 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 0
  %92 = load i32, i32* %91, align 8, !tbaa !11
  %93 = or i32 %92, 32
  store i32 %93, i32* %91, align 8, !tbaa !11
  %94 = icmp eq i32 %11, 0
  br i1 %94, label %99, label %95

95:                                               ; preds = %78
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %3) #3
  br label %99

96:                                               ; preds = %63, %74
  %97 = phi i8* [ %72, %63 ], [ %76, %74 ]
  %98 = phi i64 [ %70, %63 ], [ %64, %74 ]
  store i8* %97, i8** %0, align 8, !tbaa !13
  store i64 %98, i64* %1, align 8, !tbaa !14
  br label %101

99:                                               ; preds = %78, %95
  %100 = tail call i32* @___errno_location() #4
  store i32 12, i32* %100, align 4, !tbaa !12
  br label %157

101:                                              ; preds = %96, %57
  %102 = icmp eq i64 %59, 0
  br i1 %102, label %110, label %103

103:                                              ; preds = %101
  %104 = load i8*, i8** %0, align 8, !tbaa !13
  %105 = getelementptr inbounds i8, i8* %104, i64 %35
  %106 = load i8*, i8** %32, align 8, !tbaa !15
  %107 = tail call i8* @memcpy(i8* noundef %105, i8* noundef %106, i64 noundef %59) #3
  %108 = load i8*, i8** %32, align 8, !tbaa !15
  %109 = getelementptr inbounds i8, i8* %108, i64 %59
  store i8* %109, i8** %32, align 8, !tbaa !15
  br label %110

110:                                              ; preds = %103, %101
  %111 = phi i64 [ %60, %103 ], [ %35, %101 ]
  %112 = icmp eq i8* %58, null
  br i1 %112, label %113, label %151

113:                                              ; preds = %110
  %114 = load i8*, i8** %32, align 8, !tbaa !15
  %115 = load i8*, i8** %33, align 8, !tbaa !16
  %116 = icmp eq i8* %114, %115
  br i1 %116, label %121, label %117

117:                                              ; preds = %113
  %118 = getelementptr inbounds i8, i8* %114, i64 1
  store i8* %118, i8** %32, align 8, !tbaa !15
  %119 = load i8, i8* %114, align 1, !tbaa !17
  %120 = zext i8 %119 to i32
  br label %134

121:                                              ; preds = %113
  %122 = tail call i32 @__uflow(%struct._IO_FILE* noundef nonnull %3) #3
  %123 = icmp eq i32 %122, -1
  br i1 %123, label %124, label %134

124:                                              ; preds = %121
  %125 = icmp eq i64 %111, 0
  br i1 %125, label %131, label %126

126:                                              ; preds = %124
  %127 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %3, i64 0, i32 0
  %128 = load i32, i32* %127, align 8, !tbaa !11
  %129 = and i32 %128, 16
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %131, label %151

131:                                              ; preds = %124, %126
  %132 = icmp eq i32 %11, 0
  br i1 %132, label %157, label %133

133:                                              ; preds = %131
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %3) #3
  br label %157

134:                                              ; preds = %117, %121
  %135 = phi i32 [ %120, %117 ], [ %122, %121 ]
  %136 = add i64 %111, 1
  %137 = load i64, i64* %1, align 8, !tbaa !14
  %138 = icmp ult i64 %136, %137
  %139 = trunc i32 %135 to i8
  br i1 %138, label %143, label %140

140:                                              ; preds = %134
  %141 = load i8*, i8** %32, align 8, !tbaa !15
  %142 = getelementptr inbounds i8, i8* %141, i64 -1
  store i8* %142, i8** %32, align 8, !tbaa !15
  store i8 %139, i8* %142, align 1, !tbaa !17
  br label %149

143:                                              ; preds = %134
  %144 = load i8*, i8** %0, align 8, !tbaa !13
  %145 = getelementptr inbounds i8, i8* %144, i64 %111
  store i8 %139, i8* %145, align 1, !tbaa !17
  %146 = shl i32 %135, 24
  %147 = ashr exact i32 %146, 24
  %148 = icmp eq i32 %147, %2
  br i1 %148, label %151, label %149

149:                                              ; preds = %143, %140
  %150 = phi i64 [ %111, %140 ], [ %136, %143 ]
  br label %34

151:                                              ; preds = %143, %110, %126
  %152 = phi i64 [ %111, %126 ], [ %136, %143 ], [ %111, %110 ]
  %153 = load i8*, i8** %0, align 8, !tbaa !13
  %154 = getelementptr inbounds i8, i8* %153, i64 %152
  store i8 0, i8* %154, align 1, !tbaa !17
  %155 = icmp eq i32 %11, 0
  br i1 %155, label %157, label %156

156:                                              ; preds = %151
  tail call void @__unlockfile(%struct._IO_FILE* noundef %3) #3
  br label %157

157:                                              ; preds = %99, %151, %156, %131, %133, %25
  %158 = phi i64 [ -1, %99 ], [ -1, %25 ], [ -1, %133 ], [ -1, %131 ], [ %152, %156 ], [ %152, %151 ]
  ret i64 %158
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memchr(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @realloc(i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare protected i32 @__uflow(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

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
!10 = !{!4, !5, i64 136}
!11 = !{!4, !5, i64 0}
!12 = !{!5, !5, i64 0}
!13 = !{!8, !8, i64 0}
!14 = !{!9, !9, i64 0}
!15 = !{!4, !8, i64 8}
!16 = !{!4, !8, i64 16}
!17 = !{!6, !6, i64 0}
